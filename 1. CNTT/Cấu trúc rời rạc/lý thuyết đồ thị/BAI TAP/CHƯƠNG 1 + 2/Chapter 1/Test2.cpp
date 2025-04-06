#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

// Hàm tính bậc vào và bậc ra của các đỉnh trong đồ thị
vector<pair<int, int>> calculateDegrees(const vector<vector<int>>& adjacencyMatrix) {
    int n = adjacencyMatrix.size();
    vector<pair<int, int>> degrees(n, {0, 0});

    for (int i = 0; i < n; ++i) {
        // Tính bậc vào
        for (int j = 0; j < n; ++j) {
            if (adjacencyMatrix[j][i] == 1) {
                degrees[i].first++;
            }
        }

        // Tính bậc ra
        for (int j = 0; j < n; ++j) {
            if (adjacencyMatrix[i][j] == 1) {
                degrees[i].second++;
            }
        }
    }

    return degrees;
}

int main() {
    ifstream inFile("E:\\BacVaoRa.INP");
    ofstream outFile("E:\\BacVaoRa.OUT");

    if (!inFile.is_open() || !outFile.is_open()) {
        cerr << "Cannot open input or output file!" << endl;
        return 1;
    }

    int n;
    inFile >> n;

    vector<vector<int>> adjacencyMatrix(n, vector<int>(n));

    // Đọc ma trận kề từ file
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            inFile >> adjacencyMatrix[i][j];
        }
    }

    // Tính bậc vào và bậc ra của các đỉnh
    vector<pair<int, int>> degrees = calculateDegrees(adjacencyMatrix);

    // In số đỉnh của đồ thị ra file
    outFile << n << endl;

    // In bậc vào và bậc ra của các đỉnh ra file
    for (int i = 0; i < n; ++i) {
        outFile << degrees[i].first << " " << degrees[i].second << endl;
    }

    // Đóng các file
    inFile.close();
    outFile.close();

    return 0;
}
