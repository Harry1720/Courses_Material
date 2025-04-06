#include <iostream>
#include <stack>

using namespace std;

const int MAX_N = 100; // Số lượng tối đa của đỉnh trong đồ thị

bool visited[MAX_N];
int adj[MAX_N][MAX_N]; // Ma trận kề

void DFS(int s, int n) {
    stack<int> st;

    visited[s] = true;
    st.push(s); // Bước 2

    while (!st.empty()) {
        int u = st.top(); // Lấy 1 đỉnh u từ stack
        st.pop(); //Xóa phần tử trên đỉnh stack
        
        cout << "Dang xu ly dinh " << u << endl;

        // Tìm 1 đỉnh v kề u và chưa được viếng thăm
        for (int v = 0; v < n; ++v) {
            if (adj[u][v] && !visited[v]) {
                visited[v] = true; // Đánh dấu v đã viếng thăm
                st.push(v); // Đẩy v vào stack
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
    cout << "Nhap dinh bat dau: ";
    cin >> start_node;

    cout << "Duyet DFS tu dinh " << start_node << ":" << endl;

    DFS(start_node, n);

    return 0;
}
