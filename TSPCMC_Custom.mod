/*********************************************
 * OPL 12.5 Model
 * Author: akm3
 * Creation Date: Nov 10, 2013 at 6:50:29 PM
 *********************************************/
// TSP + HPC + Multiple Cores
 
/******************* PARAMETERS ************************/
// Nodes
 int n = ...; // Number of nodes
 range AllNodes   = 0..n-1; // all possible nodes
 range AllPDNodes = 0..2*n-1;
 
 {int} InNodes  = ...; // Nodes to be visited in order now
 {int} Nodes    =  {i-n | i in InNodes : i >= n}; // Nodes that need (at least) delivery, T[i] shall be 0 for these
 //{int} DelNodes =  {i | i in InNodes : i >= n}; // Nodes that need (at least) delivery, T[i] shall be 0 for these
 {int} PDNodes  =  {i | i in InNodes : i < n}; // Nodes that need pickup and delivery to visit

 
 int first_node = ...; // First node to be visited
 
// Edges and Arcs
 tuple edge{
   int i; 
   int j;
   }
   
{edge} AllEdges  = {<i,j> | ordered i,j in AllNodes};
{edge} AllUEdges = {<i,j> | i,j in AllNodes : i != j};
{edge} AllArcs   = {<i,j> | i,j in AllPDNodes : i != j};

{edge} Edges  = {<i,j> | ordered i,j in Nodes};
{edge} UEdges = {<i,j> | i,j in Nodes : i != j};
{edge} Arcs   = {<i,j> | i,j in InNodes : i != j};

 // Distance and Travel times
 float tdist[AllEdges] = ...;


// Setting up Arcs
float t[AllPDNodes][AllPDNodes];
execute INITIALIZE{
	for (var e in AllEdges){
	  t[e.i][e.j] = tdist[e];
	  t[e.i][e.j+n] = tdist[e];
	  t[e.i+n][e.j] = tdist[e];
	  t[e.i+n][e.j+n] = tdist[e];
	  
	  t[e.j][e.i] = tdist[e];
	  t[e.j][e.i+n] = tdist[e];
	  t[e.j+n][e.i] = tdist[e];
	  t[e.j+n][e.i+n] = tdist[e];
	  
	}
}

//// Processing Times
int m = ...; // Number of cores
range Cores = 0..m-1;
float T[Cores][AllNodes] = ...;

// Big M Variable
float M = 0;
execute INITIALIZE2{
  for (var e in AllArcs){
    M = M + t[e.i][e.j];
  }
  for(var i in Nodes){
    M = M + T[0][i];  
  } 
}

/******************* VARIABLES ************************/
// Decision Variables
 //dvar boolean x[PDNodes][PDNodes];  //Inclusion on Arc i --> j
 dvar boolean x[Arcs];  //Inclusion on Arc i --> j
 dvar float r[InNodes];   //Arrival time at a node
 dvar float W[Nodes]; //WaitTime at nodes
 dvar float s[Nodes];     //Start processing time of a node 
 dvar boolean y[Nodes][Nodes]; // Does taks i come before task j (0 in unrelated)
 dvar boolean z[Cores][Nodes]; // Is task i scheduled on machine i?

 
  /******************* PROBLEM ************************/
// Problem Statement
//minimize 
// 	sum (e in Arcs) t[e.i][e.j] * x[e.i][e.j] + sum (i in Nodes) W[i];
// 	
minimize
    r[n];

subject to{
   forall (j in InNodes){
     sum(<i,j> in Arcs) x[<i,j>] == 1;
   }
	   forall (j in InNodes){       
     sum(<j,i> in Arcs) x[<j,i>] == 1;
   }
   
   x[<n,first_node>] == 1;
   
   forall(i in Nodes){
     sum(k in Cores) (z[k][i]) == 1; // Cores assignment
     s[i] >= 0;
     W[i] >= 0;
     s[i] + sum(k in Cores) (z[k][i]*T[k][i]) <= r[i+n] + W[i]; 
     W[i] >= s[i]+ sum(k in Cores) (z[k][i]*T[k][i])  - r[i+n];
   }   
   
   forall (i in InNodes){
     r[i] >= 0;
   }  
   
   forall (i in PDNodes){
     s[i] >= r[i];
     r[i+n] >= r[i];
     }
     	     
     r[first_node] == 0;
     s[0] == 0;
     W[0] == 0;
     
     forall(e in Arcs : e.j != first_node){
     	if(e.i <= n-1){ // e.i is pickup
     	  r[e.i] + t[e.i][e.j] - (1-x[e])*M <= r[e.j];
     	  //r[e.j] - r[e.i] + t[e.i][e.j] <= M*(1-x[e.i][e.j]);
        }     	     
        else {  //e.i is delivery
          r[e.i] + W[e.i-n]+ t[e.i][e.j] - (1-x[e])*M <= r[e.j];
          //r[e.j] - r[e.i] + maxl((s[e.i-n]+T[e.i-n])-r[e.i], 0)+ t[e.i][e.j] <= M*(1-x[e.i][e.j]);
        }    
    }
       
	forall(e in UEdges){
	   s[e.i] + sum(k in Cores)(z[k][e.i]*T[k][e.i]) - (1 - y[e.i][e.j])*M <= s[e.j];
    }
    
    forall(e in Edges){	    
	   y[e.i][e.j] + y[e.j][e.i] <= 1;
	   forall(k in Cores){
	     z[k][e.i] + z[k][e.j] - y[e.i][e.j] - y[e.j][e.i] <= 1;
	     forall(l in Cores: l != k){
	       z[l][e.i] + z[k][e.j] + y[e.i][e.j] + y[e.j][e.i] <= 2;
	     }	     
	   }
    }	
}


/******************* Collect Results ************************/

 
main {
	thisOplModel.generate();
	cplex.exportModel("./TSPCMC_Custom.lp");    
    
}


