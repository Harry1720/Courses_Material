#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

// Hàm tính bậc của các đỉnh trong đồ thị
vector<int> calculateDegrees(const vector<vector<int>>& adjacencyMatrix) {
    int n = adjacencyMatrix.size();
    vector<int> degrees(n, 0);

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            if (adjacencyMatrix[i][j] == 1) {
                degrees[i]++;
            }
        }
    }

    return degrees;
}

int main() {
    ifstream inFile("E:\\BacDoThiVoHuong.INP");
    ofstream outFile("E:\\BacDoThiVoHuong.OUT");

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

    // Tính bậc của các đỉnh
    vector<int> degrees = calculateDegrees(adjacencyMatrix);

    // In số đỉnh của đồ thị ra file
    outFile << n << endl;

    // In bậc của các đỉnh ra file
    for (int i = 0; i < n; ++i) {
        outFile << degrees[i] << " ";
    }

    // Đóng các file
    inFile.close();
    outFile.close();

    return 0;
}
