#include <iostream>
#include <fstream>
#include <cstring>

using namespace std;

int main() {
    ifstream infile("E:\\undirected_adjacency_list.txt"); // Mở file để đọc

    int n; // Số đỉnh
    infile >> n; // Đọc số đỉnh từ dòng đầu tiên của file

    // Tạo mảng để lưu danh sách kề
    int **adjacency_list = new int*[n];
    int *degrees = new int[n](); // Mảng lưu trữ bậc của mỗi đỉnh, được khởi tạo với giá trị 0

    // Đọc danh sách kề từ file
    for (int i = 0; i < n; ++i) {
        int neighbor;
        adjacency_list[i] = new int[n]; // Mảng lưu trữ các đỉnh kề
        int count = 0;
        while (true) {
            infile >> neighbor;
            if (neighbor == -1) break; // Kết thúc danh sách kề của một đỉnh
            adjacency_list[i][count++] = neighbor;
            // Tăng bậc của đỉnh kề lên 1
            degrees[i]++;
        }
        // Đánh dấu kết thúc danh sách kề
        adjacency_list[i][count] = -1;
    }

    infile.close(); // Đóng file sau khi đọc xong

    // Mở file để ghi kết quả
    ofstream outfile("E:\\out_undirected_adjacency_list.txt");
    if (!outfile.is_open()) {
        cerr << "Không thể tạo file đầu ra.";
        return 1;
    }

    // Ghi số đỉnh
    outfile << n << endl;

    // Ghi dãy bậc
    for (int i = 0; i < n; ++i) {
        outfile << degrees[i];
        if (i != n - 1) {
            outfile << " ";
        }
    }

    // Đóng tệp
    outfile.close();

    // Giải phóng bộ nhớ
    for (int i = 0; i < n; ++i) {
        delete[] adjacency_list[i];
    }
    delete[] adjacency_list;
    delete[] degrees;

    return 0;
}
