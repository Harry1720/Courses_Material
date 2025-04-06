#include <iostream>

using namespace std;

// Định nghĩa cấu trúc cạnh
struct Edge {
    int src, dest, weight;
};

// Hàm swap hai cạnh
void swapEdges(Edge& a, Edge& b) {
    Edge temp = a;
    a = b;
    b = temp;
}

// Hàm sắp xếp mảng các cạnh theo trọng số tăng dần
void sortEdges(Edge edges[], int E) {
    for (int i = 0; i < E - 1; ++i) {
        for (int j = 0; j < E - i - 1; ++j) {
            if (edges[j].weight > edges[j + 1].weight) {
                swapEdges(edges[j], edges[j + 1]);
            }
        }
    }
}

// Hàm tìm nhóm gốc của đỉnh u trong DSU
int find(int u, int parent[], int rank[]) {
    if (parent[u] != u)
        parent[u] = find(parent[u], parent, rank);
    return parent[u];
}

// Hàm gộp hai nhóm chứa u và v trong DSU
void union_sets(int u, int v, int parent[], int rank[]) {
    u = find(u, parent, rank);
    v = find(v, parent, rank);

    if (rank[u] > rank[v])
        parent[v] = u;
    else {
        parent[u] = v;
        if (rank[u] == rank[v])
            rank[v]++;
    }
}

// Hàm thực hiện thuật toán Kruskal
void kruskalMST(Edge edges[], int V, int E) {
    sortEdges(edges, E); // Sắp xếp các cạnh theo trọng số tăng dần

    cout << "Cay khung nho nhat:\n";
    int mstWeight = 0;
    int parent[V];
    int rank[V];
    for (int i = 0; i < V; ++i) {
        parent[i] = i;
        rank[i] = 0;
    }

    for (int i = 0; i < E; ++i) {
        int u = edges[i].src;
        int v = edges[i].dest;

        int uSet = find(u, parent, rank);
        int vSet = find(v, parent, rank);

        if (uSet != vSet) { // Nếu 2 đỉnh thuộc 2 nhóm khác nhau
            cout << u << " - " << v << ": " << edges[i].weight << endl; // In cạnh vào cây khung
            mstWeight += edges[i].weight; // Cập nhật trọng số của cây khung
            union_sets(uSet, vSet, parent, rank); // Gộp 2 nhóm lại thành một
        }
    }
    cout << "Tong trong so: " << mstWeight << endl;
}

int main() {
    int V = 8; // Số đỉnh
    int E = 16; // Số cạnh
    Edge edges[] = {
        {1, 6, 54}, {1, 3, 47}, {1, 5, 80}, {3, 6, 75},
        {3, 5, 23}, {3, 4, 88}, {3, 2, 55}, {3, 7, 66},
        {5, 2, 32}, {5, 7, 93}, {6, 4, 74}, {2, 4, 31},
        {2, 7, 74}, {2, 8, 79}, {7, 8, 68}, {4, 8, 29}
    };

    kruskalMST(edges, V, E);

    return 0;
}