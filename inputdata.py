#!/usr/bin/python


"""Read data from a .dat file."""
import re
from StringIO import StringIO
import ast

def CommentRemover(text):
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return ""
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)


def ReadDatFile(filename):
    """Return a list containing the data stored in the dat file.

    Single integers or floats are stored as their natural type.

    1-d arrays are stored as lists
    
    2-d arrays are stored as lists of lists.
    
    NOTE: the 2-d arrays are not in the list-of-lists matrix format
    that the python methods take as input for constraints.

    """
    f = open(filename)
    data = file.read(f)
    data = CommentRemover(data)
    #stream = StringIO(data)
    return data

def ReadData(inputFile):
    data = ReadDatFile(inputFile)
    pat = re.compile(r'\s+')
    data = re.sub(pat, '', data)
    n =  ReadVariable(data, 'n')
    m =  ReadVariable(data, 'm')
    first_node =  ReadVariable(data, 'first_node')
    Nodes =  ReadVariable(data, 'InNodes', 'set')
    T =  ReadVariable(data, 'T', 'dict')
    tdist_ =  ReadVariable(data, 'tdist', 'list')
    tdist = Processt_dist(tdist_, n)
    return n, m, first_node, Nodes, tdist, T
    
def WriteDat(inputFile, varNames, vars, varTypes):
    """Writes variables int the format suitable for cplex
    dat file
    three lists called varNames, vars and varTypes
    give values for the variables names' their valeus
    and their types respectively to be written into 
    inputFile (obv. these three lists shall be of the
    same length)"""
    file = open(inputFile, 'w')
    if len(varNames) != len(vars) or len(varNames) != len(varTypes):
        print 'WriteDat() Error, varName, vars and varTypes shall be of the same length'
        return -1
    for i in range (len(varNames)):
        WriteVariable(file, vars[i], varNames[i], varTypes[i])

def ReadVariable(data, VarName, VarType=None):
    if VarType == 'dict':
        pat=re.compile(VarName+'=#\[(.*?)\]#;',re.DOTALL|re.M)
        Var_ =  pat.findall(data)[0]
        Var_ = '{' + Var_ + '}'
    elif VarType == 'list':
        pat=re.compile(VarName+'=\[(.*?)\];',re.DOTALL|re.M)
        Var_ =  pat.findall(data)[0]
        Var_ = '[' + Var_ + ']'
    elif VarType == 'set':
        pat=re.compile(VarName+'=\{(.*?)\};',re.DOTALL|re.M)
        Var_ =  pat.findall(data)[0]
        Var_ = '[' + Var_ + ']'
    elif VarType == None:
        pat=re.compile(VarName+'=(.*?);',re.DOTALL|re.M)
        Var_ =  pat.findall(data)[0]
    else:
        print('Choose Correct VarType')
        return -2
        
    if Var_:
        Var =  ast.literal_eval(Var_)
        if VarType == 'set':
            Var = set(Var)
        return Var
    else:
        print(VarName + ' Note found')
        return -1

def WriteVariable(file, var, varName, varType=None):
    if varName == 'tdist':
        var = Processt_dist_reverese(var)
    if varType == 'dict':
        line = varName + ' = #[\n'
        file.write(line)
        L = len(var.keys())
        l = 0
        for i in var.keys():
            line = '\t' + str(i) + ' : ' +  str(var[i]) 
            l = l + 1
            if l != L:
                line = line + ',\n'
            else:
                line = line + '\n'
            file.write(line)
        line = '\t#];\n'
        file.write(line)
    elif varType == 'set':
        var = str(list(var))
        line = varName + ' = {' + var[1:-1] + '};\n'
        file.write(line)
    elif varType == 'list' or varType == None:
        line = varName + ' = ' + str(var) + ';\n'
        file.write(line)
    file.write('\n')
    return
                
            
def Processt_dist(tdist_, n):
    """Changes t_dist into dictionary form"""
    c = 0
    tdist = {}
    for i in range(0, n):
        for j in range(i, n):
            if i != j:
                tdist_[c] = int(tdist_[c])
                try:
                    tdist[(i, j)] = tdist_[c]
                    c = c + 1
                except ValueError:
                    print('defined distances do not match n')
                    return
        tdist[(i, i)] = 0
    return tdist

#def Processt_dist_reverese(tdist_):
#    return tdist_.values()
#
#def print_dict(d, name):
#    for i in d.keys():
#        print name + '(' + str(i) + ') = ' + str(d[i])
#    return
#
#def print_x(x, InNodes):
#    for i in InNodes:
#        for j in InNodes:
#            if i != j:
#                print 'x(' +str(i) + ' , ' + str(j) + ') = ' + str(x[i,j])
#    return