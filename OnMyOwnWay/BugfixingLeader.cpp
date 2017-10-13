//
//  BugfixingLeader.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 11..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//
// Reference By https://codility.com/public-report-detail/

#include <iostream>
using namespace std;

int A[] = {10,10,9,9,9,10,10,10};

int solution() {
    int n = sizeof(A) / sizeof(int);
    
    
    int* L = new int[n + 1];
    
    L[0] = -1;

    for (int i = 0; i < n; i++) {
        L[i + 1] = A[i];
    }
    
    sort(L, L+n);
    
    int count = 0;
    
    int pos = (n + 1) / 2;
    
    // 10
    int candidate = L[pos];
    
    for (int i = 1; i <= n; i++) {
        
        if (L[i] == candidate)
            count = count + 1;
    }
    
    if (count > pos)
        return candidate;
    
    return (-1);
}

int main() {
    
    int result = solution();
    
    cout << result << endl;
    
    return 0;
}



















