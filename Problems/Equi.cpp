//
//  Equi.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 11..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/public-report-detail/

#include <iostream>
using namespace std;

int solution(int A[], int N) {
    
    for(int i = 0; i < N; i++) {
        int frontSum = 0;
        int backSum = 0;
        
        // 전반부
        for(int q = 0; q < i; q++) {
            if(i == 0) {
                frontSum = 0;
                break;
            }else {
                frontSum += A[q];
            }
        }
        
        // 후반부
        for(int w = i+1; w < N; w++) {
            if(i == N-1) {
                backSum = 0;
                break;
            }else {
                backSum += A[w];
            }
        }
        
        if(frontSum == backSum) {
            // cout << i << endl;
            return i;
        }
    }
    
    return -1;
}

int main() {
    
    int arr[] = {-1, 3, -4, 5, 1, -6, 2, 1};
    
    int result = solution(arr, 8);
    cout << result << endl;
    
    return 0;
}

























