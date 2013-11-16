#!/usr/bin/python

import cplex
from cplex.exceptions import CplexSolverError
import os
import subprocess
import math


"""Utilities To help process Cplex results"""
def getVariables(CplexObj, InNodes, n, m):  
    """Read decision variables returned by cplex"""
    x = {}
    y = {}
    r = {}
    s = {}
    z = {}
    # Read s, y , m
    Nodes = set()
    for i in InNodes:
        if i >= n:
            Nodes.add(i-n)
    for i in Nodes:
        Value = 's(' + str(i) + ')'
        s[i] = CplexObj.solution.get_values(Value)
        for j in Nodes:
            if i != j:
                Value = 'y(' + str(i) + ')(' + str(j) + ')'
                y[(i, j)] = CplexObj.solution.get_values(Value)
        for k in range(m):
            Value = 'z(' + str(k) + ')(' + str(i) + ')'
            z[(k, i)] = CplexObj.solution.get_values(Value)          
    
    for i in InNodes:
        Value = 'r(' + str(i) + ')'
        if i < n:
            r['+'+str(i)] = CplexObj.solution.get_values(Value)
        else:
            r['-'+str(i-n)] = CplexObj.solution.get_values(Value) 
  
        for j in InNodes:
            if j != i:
                Value = 'x({' + str(i) + ',' + str(j) + '})'
                x[(i, j)] = CplexObj.solution.get_values(Value)
    return [x, r, s, y, z]


def Create_lp(modFile, datFile, Cplex_bin='/opt/ibm/ILOG/CPLEX_Studio1251/opl/bin/x86-64_sles10_4.1'):
    """"Create lp model for the problem"""
    os.environ['LD_LIBRARY_PATH'] = os.environ['LD_LIBRARY_PATH'] + ':' + Cplex_bin
    os.environ['PATH'] = os.environ['PATH'] + ':' + Cplex_bin
    command = 'oplrun ' + modFile + ' ' + datFile
    subprocess.call(command, shell=True)
    

def GetNodes(InNodes, n):
    """InNodes is the input to dat file with nodes in a range 0..2*n-1
    Nodes will be the values in 0...n-1 used to access task proc. times
    and schedules, etc"""
    Nodes = set()
    for i in InNodes:
        if i >= n:
            Nodes.add(i-n)
    return Nodes

def RetrievTour(x, InNodes, first_node, n):
    '''
    Finds the tour from variables x returned by cplex
    '''
    tour = []
    if first_node < n:
        tour.append('+'+str(first_node))
    else:
        tour.append('+'+str(first_node-n))
    Current = first_node
    for t in InNodes:
        for i in InNodes:
            if i != Current and x[(Current, i)] == 1:
                if i < n:
                    tour.append('+' + str(i))
                else:
                    tour.append('-' + str(i - n))
                Current = i
                break
    tour = tour[0:-1]
    return tour

def RetrieveSchedulingOrder(y, z, Nodes, n, m):
    '''
    Finds the order of scheduling in the form of 
    [first_node, sceond_node, ..., last_node] from
    the variables y returned by Cplex
    '''
    Priority = {}
    for k in range(m):
        Priority[k] = []
    for i in Nodes:
        for k in range(m):
            if z[(k,i)] == 1:
                Priority[k].append(i)
    
    for i in Nodes:
        for j in Nodes:
            if i != j and y[(i, j)] == 1:
                for k in range(m):
                    if i in Priority[k] and j in Priority[k]:
                        i_index = Priority[k].index(i)
                        j_index = Priority[k].index(j)
                        if i_index > j_index:
                            Priority[k][j_index] = i
                            Priority[k][i_index] = j
    return Priority

def FindVisitTimes(tour, tdist, Priority, T, InNodes, first_node, n, ReturnMode=0):
    '''
    Finds the time to visit each of the nodes in 
    the current tour
    tour = current tour in the format [+i, -j, etc]
    tdist = distance between nodes {(i,j): distance}
    Priority = current processing order for nodes in tour
    (s[i] = j means that at position i, node j is processed)
    T = processing time of tasks at nodes
    ReturnMode: if set to 1, returns R['-0'], ow returns R, W as lists
    '''

    Nodes = set()
    for i in InNodes:
        if i >= n:
            Nodes.add(i-n)
    

    m = len(Priority.keys())
    
    s_current = m*[0] # current possible start of processing for each core
    R = {}  # {Node in tour:visit time}
    if first_node < n:
        first_node_str = '+'+str(first_node)
    else:
        first_node_str = '-'+str(first_node-n)
    R[first_node_str] = 0.0
    prev = first_node_str
    for i in tour[1:]:
        i1 = abs(int(i))
        j1 = abs(int(prev))
        R[i] = R[prev] + tdist[(min(i1, j1), max(i1, j1))]
        prev = i
    # print 'Visit times', R
    W = {}
    for i in InNodes:
        if i >= n:
            W[i-n] = 0
    
    for i in tour[1:]:
        if i[0] == '-' : #Delivery Location
            delivery_location = i
            pickup_location = '+' + i[1] # corresponding pickup
            node_index = abs(int(i[1])) # index of the node
            for k in range(m):
                if node_index in Priority[k]:
                    core_index = k # core in which node is scheduled
                    break
            if pickup_location in tour: 
                completion_time = max(s_current[core_index], R[pickup_location]) + T[core_index][node_index]
            else:
                completion_time = s_current[core_index] + T[core_index][node_index]
            s_current[core_index] = completion_time
            delivery_time = R[delivery_location]
            wait_time = completion_time - delivery_time
            if wait_time > 0:
                W[node_index] = wait_time
                index = tour.index(i)
                for j in tour[index+1:]:
                    R[j] = R[j] + wait_time
        
    if ReturnMode == 0:         
        return R, W
    else:
        return R['-0']
    
def UpdateParameters(cutting_node, tour, Nodes, s, Priority, T, R):
    Now = R[cutting_node]
    current_index = tour.index(cutting_node)
    m = len(T.keys())
    n = len(T[0])
    for i in Nodes:
        for k in range(m):
                if i in Priority[k]:
                    core_index = k # core in which node is scheduled
                    break
        if s[i] + T[core_index][i] < Now:
            percentage_completed = float(Now - (s[i] + T[core_index][i])) / float(T[core_index][i])
            for k in range(m):
                T[k][i] = int()



    return 0