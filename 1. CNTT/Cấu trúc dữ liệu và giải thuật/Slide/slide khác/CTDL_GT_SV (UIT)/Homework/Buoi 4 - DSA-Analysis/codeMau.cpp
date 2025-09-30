// 1 số mẫu test: => random 1 mảng 1 chiều có số lượng phần tử từ ít tới nhiều
// 10 phần tử, 100 phần tử, 1,000, 10,000, 100,000 phần tử

#include <stdlib.h>     /* srand, rand */
#include <time.h>
#define MAXN 500000

float ThuatToan1(int a[], int n) {
    begin = clock(); 1000
    int maxSum = 0;
    for(int i = 0; i < n; i++ )
        for(int j = i; j < n; j++) {
            int thisSum = 0;
            for(int k = i; k <= j; k++ )
                thisSum += a[k];
            if (thisSum > maxSum)
                maxSum = thisSum;
        }
    return maxSum;
    end = clock(); 4000
    return ((float)end-begin)/CLOCKS_PER_SEC)  => giây?
}

int ThuatToan2() {
    int maxSum = 0, thisSum = 0;
    for( int j = 0; j < a.size( ); j++ ) {
        thisSum += a[j];
        if ( thisSum > maxSum )
            maxSum = thisSum;
        else if ( thisSum < 0 )
            thisSum = 0;
    }
    return maxSum;
}

void RandomArray(int a[], int n){
    srand (time(NULL));
    for(int i=0->n-1)
        a[i]=rand()%1000-rand(); // Ghi chú tạo ds có số âm, số dương
}
int main() {
    int a[MAXN], n, t1 ,t2;
    int test[10]={10, 100, 1000, 10000, 100000, 200000, 300000, 400000, 500000}, ntest=5;
    for(i=0->ntest){
        n=test[i];
        RandomArray(a, n);
        t1=ThuatToan1(a,n); => >5 phút
        t2=ThuatToan2(a, n); => 1 phút
        cout << t1 << "vs" << t2;
    }

}

