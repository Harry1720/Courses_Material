#include<iostream>
#include<vector>
#include<cmath>
#define NODE 6

using namespace std;
int graph[NODE][NODE] = {
   		{0, 1, 1, 1, 1, 0},
        {1, 0, 0, 1, 0, 0},
        {1, 0, 0, 1, 1, 1},
        {1, 1, 1, 0, 0, 1},
        {1, 0, 1, 0, 0, 0},
        {0, 0, 1, 1, 0, 0}
};
int tempGraph[NODE][NODE];
int findStartVert() {
   for(int i = 0; i<NODE; i++) {
      int deg = 0;
      for(int j = 0; j<NODE; j++) {
         if(tempGraph[i][j])
            deg++; //increase degree, when connected edge found
      }
      if(deg % 2 != 0) //when degree of vertices are odd
      return i; //i is node with odd degree
   }
   return 0; //when all vertices have even degree, start from 0
}
int dfs(int prev, int start, bool visited[]){
   int count = 1;
   visited[start] = true;
   for(int u = 0; u<NODE; u++){
      if(prev != u){
         if(!visited[u]){
            if(tempGraph[start][u]){
               count += dfs(start, u, visited);
            }
         }
      }
   }
   return count;
}
bool isBridge(int u, int v) {
   int deg = 0;
   for(int i = 0; i<NODE; i++)
      if(tempGraph[v][i])
   deg++;
   if(deg>1) {
      return false; //the edge is not forming bridge
   }
   return true; //edge forming a bridge
}
int edgeCount() {
   int count = 0;
   for(int i = 0; i<NODE; i++)
      for(int j = i; j<NODE; j++)
         if(tempGraph[i][j])
   count++;
   return count;
}
void fleuryAlgorithm(int start) {
   static int edge = edgeCount();
   static int v_count = NODE;
   for(int v = 0; v<NODE; v++) {
      if(tempGraph[start][v]) {
         bool visited[NODE] = {false};
         if(isBridge(start, v)){
            v_count--;
         }
         int cnt = dfs(start, v, visited);
         if(abs(v_count-cnt) <= 2){
            cout << char('A'+start) << "--" << char('A'+v) << " ";
            if(isBridge(v, start)){
               v_count--;
            }
            tempGraph[start][v] = tempGraph[v][start] = 0; //remove edge from graph
            edge--;
            fleuryAlgorithm(v);
         }
      }
   }
}
int main() {
   for(int i = 0; i<NODE; i++) //copy main graph to tempGraph
   for(int j = 0; j<NODE; j++)
      tempGraph[i][j] = graph[i][j];
   cout << "Euler Path Or Circuit: ";
   fleuryAlgorithm(findStartVert());
}