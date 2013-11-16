#!/usr/bin/python
import cplex
from cplex.exceptions import CplexSolverError
import os

from operator import itemgetter
from inputdata import *
#from inputdata import print_x
from CplexUtilities import *



def main():
    lpModel = 'TSPCMC_Custom.lp'
    modFile ='TSPCMC_Custom.mod'
    datFile ='TSPCMC_Custom.dat'
    datFile_tmp = 'TSPCMC_Custom_tmp.dat'
    [n, m, first_node, InNodes, tdist, T] = ReadData(datFile)
    #Nodes = set()
    #for i in InNodes:
    #    if i >= n:
    #        Nodes.add(i-n)
    #try:
    #    os.remove(lpModel)
    #except OSError:
    #    pass
    #
    #Create_lp(modFile, datFile)
    ## Get Model
    #c = cplex.Cplex(lpModel)
    ## Solve
    #try:
    #    c.solve()
    #except CplexSolverError:
    #    print "Exception raised during solve"
    #    return
    #Obj =  c.solution.get_objective_value()
    #
    #[x, r, s, y, z] = getVariables(c, InNodes, n, m)
    #print 'first_node = ' + str(first_node)
    #tour = RetrievTour(x, InNodes, first_node, n)
    #Priority = RetrieveSchedulingOrder(y, z, Nodes, n, m)
    #[R, W] =  FindVisitTimes(tour, tdist, Priority, T, InNodes, first_node, n)
    ## Create Processing order in a print format
    #string = '{'
    #for i in tour:
    #    string = string + i + ' : ' + str(R[i]) + ' , '
    #string = string + ' }'
    #print '--------------------------'
    #print 'Objective Value = ' + str(Obj)
    #print '--------------------------'
    #print 'Tour'
    #print tour
    #print '--------------------------'
    #print 'Processing Times'
    #print s
    #print '--------------------------'
    #print 'Processcing Order'
    #print Priority
    #print '--------------------------'
    #print 'Visit Times'
    #print string
    #print '--------------------------'
    #print 'Wait Times'
    #print W
    ##WriteDat(datFile_tmp, ['T','tdist','InNodes'], [T,tdist,InNodes], ['dict','list','set'])
    print GetNodes(InNodes, n)

if __name__ == '__main__':
    main()