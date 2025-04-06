#include <iostream>

using namespace std;

const int MAX_N = 100; // Số lượng tối đa của đỉnh trong đồ thị

bool visited[MAX_N];
int adj[MAX_N][MAX_N]; // Ma trận kề

void DFS(int s, int n) {
    if (visited[s]) return; // Bước 1
    visited[s] = true;

    // Xử lý đỉnh s ở đây
    cout << "Dang xu ly " << s << endl;

    // Bước 2: Duyệt qua tất cả các đỉnh kề của đỉnh s
    for (int u = 0; u < n; ++u) {
        if (adj[s][u])
            DFS(u, n);
    }
}

int main() {
    int n, m; // Số đỉnh và số cạnh
    cout << "Nhap so dinh va so canh: ";
    cin >> n >> m;

    cout << "Nhap " << m << " canh:" << endl;
    for (int i = 0; i < m; ++i) {
        int u, v;
        cin >> u >> v;
        adj[u][v] = adj[v][u] = 1; // Đánh dấu cạnh u-v tồn tại
    }

    int start_node;
    cout << "Nhap dinh bat dau: ";
    cin >> start_node;

    cout << "Duyet DFS tu dinh " << start_node << ":" << endl;
    DFS(start_node, n);

    return 0;
}
