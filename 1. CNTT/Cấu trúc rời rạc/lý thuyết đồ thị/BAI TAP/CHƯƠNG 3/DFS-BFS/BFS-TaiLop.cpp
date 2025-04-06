#include <iostream>
#include <queue>

using namespace std;

const int MAX_N = 100; // Số lượng tối đa của đỉnh trong đồ thị

bool visited[MAX_N];
int adj[MAX_N][MAX_N]; // Ma trận kề

void BFS(int s, int n) {
    queue<int> q;

    visited[s] = true;
    q.push(s);

    while (!q.empty()) {
        s = q.front();
        q.pop();

        // Xử lý đỉnh s ở đây
        cout << "Dang xu ly dinh " << s << endl;

        // Duyệt qua tất cả các đỉnh kề của đỉnh s
        for (int u = 0; u < n; ++u) {
            if (adj[s][u] && !visited[u]) {
                visited[u] = true;
                q.push(u);
            }
        }
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
    cout << "Nhap dnh bat dau: ";
    cin >> start_node;

    cout << "Duyet BFS tu dinh " << start_node << ":" << endl;

    BFS(start_node, n);

    return 0;
}
