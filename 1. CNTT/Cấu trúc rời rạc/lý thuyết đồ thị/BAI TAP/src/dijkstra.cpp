#include <iostream>
#include <queue>
#include <climits>
#include <string>
using namespace std;

#define V 14  // Số lượng đỉnh
#define INF INT_MAX  // Giá trị vô cùng

// Ma trận trọng số của đồ thị có hướng
int graph[V][V] = {
    {INF, 4, INF, INF, INF, INF, 2, INF, INF, INF, INF, 3, INF, INF},
    {INF, INF, 1, 5, 1, INF, INF, INF, INF, INF, INF, INF, INF, INF},
    {INF, INF, INF, INF, INF, INF, 4, INF, 6, INF, INF, INF, INF, INF},
    {INF, INF, INF, INF, 7, INF, INF, INF, INF, INF, 4, INF, INF, INF},
    {INF, 12, INF, INF, INF, 2, INF, INF, 2, INF, INF, INF, INF, INF},
    {INF, INF, INF, INF, INF, INF, INF, INF, 1, INF, 9, INF, INF, INF},
    {INF, 2, 4, INF, INF, INF, INF, INF, INF, 8, INF, 3, INF, INF},
    {INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 4, INF, 1, 1},
    {INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 1, 10, INF, INF},
    {INF, INF, 6, INF, INF, INF, INF, INF, INF, INF, INF, 2, INF, 3},
    {INF, INF, INF, INF, INF, INF, INF, 4, 1, INF, INF, INF, 1, INF},
    {INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 5},
    {INF, INF, INF, INF, INF, INF, INF, 1, 10, INF, INF, INF, INF, INF},
    {INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, INF, 6, 3, INF}
};

string vertex_names = "abcefgpquvwxyz";

// Hàm in đường đi từ đỉnh xuất phát đến đỉnh đích
void printPath(int prev[], int dest, string vertex_names) {
    if (prev[dest] == -1) {
        cout << vertex_names[dest];
        return;
    }

    printPath(prev, prev[dest], vertex_names);
    cout << " -> " << vertex_names[dest];
}


// Hàm tìm đường đi ngắn nhất từ đỉnh s
void dijkstra(int s) {
    int dist[V];  // Mảng lưu đường đi ngắn nhất
    int prev[V];  // Mảng lưu đỉnh trước đó trong đường đi ngắn nhất
    bool visited[V];  // Mảng đánh dấu đỉnh đã được xét

    // Khởi tạo các mảng
    for (int i = 0; i < V; i++) {
        dist[i] = INF;
        prev[i] = -1;
        visited[i] = false;
    }

    // Đường đi từ s đến s là 0
    dist[s] = 0;

    // Tạo hàng đợi ưu tiên để lấy đỉnh có đường đi ngắn nhất
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
    pq.push(make_pair(0, s));

    while (!pq.empty()) {
        int u = pq.top().second;
        pq.pop();

        if (visited[u])
            continue;

        visited[u] = true;

        // Lấy tất cả đỉnh kề với u
        for (int v = 0; v < V; v++) {
            // Nếu có cung từ u đến v và đường đi qua u ngắn hơn
            if (graph[u][v] != INF && dist[v] > dist[u] + graph[u][v]) {
                dist[v] = dist[u] + graph[u][v];
                prev[v] = u;
                pq.push(make_pair(dist[v], v));
            }
        }
    }

    // In đường đi ngắn nhất từ s đến tất cả các đỉnh
    cout << "Duong di ngan nhat tu dinh " << vertex_names[s] << " den cac dinh khac la:\n";
    for (int i = 0; i < V; i++) {
        if (dist[i] == INF)
            cout << "Khong co duong di tu " << vertex_names[s] << " den " << vertex_names[i] << "\n";
        else {
            cout << "Duong di ngan nhat tu " << vertex_names[s] << " den " << vertex_names[i] << " co do dai " << dist[i] << ": ";
            printPath(prev, i, vertex_names);
            cout << "\n";
        }
    }
}


int main() {
    dijkstra(0);  // Đỉnh xuất phát là 0 (tương ứng với 'a')
    return 0;
}