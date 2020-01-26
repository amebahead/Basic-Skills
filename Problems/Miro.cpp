#include <iostream>
using namespace std;

int n = 0;
int arr1[100] = {0,};
int arr2[100] = {0,};

int resArr[100] = {0,};

void binaryPrint(int num) {
    Stack stack = Stack();

    int res = num;
    while(true) {
        int namo = res % 2;
        res = res / 2;
        stack.push(namo);

        if (res == 1) {
            break;
        }
    }

    while(true) {
        int value = stack.pop();
        if (value >= 0) {
            if (value == 1) {
                print("#");
            }
            else if (value == 0) {
                print(" ");
            }
        }else {
            break;
        }
    }

    println("");
}

int main() {
    cin >> n;

    for(int i = 0; i < n; i++) {
        cin >> arr1[i];
    }

    for(int j = 0; j < n; j++) {
        cin >> arr2[j];
    }

    //
    for(int k = 0; k < n; k++) {
        int res = arr1[k] | arr2[k];
        resArr[k] = res;
    }
    //
    for(int q = 0; q < n; q++) {
        binaryPrint(resArr[q]);
    }
    
    return 0;
}