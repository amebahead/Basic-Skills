//
//  BaeMin_Four.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 14..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
#include <cmath>
using namespace std;

int solution(vector<int>& A, int X) {
    int N = A.size();
    if (N == 0) {
        return -1;
    }
    int l = 0;
    int r = N - 1;
    while (l < r) {
        int m = (l + r) / 2;
        if (A[m] >= X) {
            r = m;
        } else {
            l = m + 1;
        }
    }
    if (A[l] == X) {
        return l;
    }
    return -1;
}

int main() {
    vector<int> v;
    v.push_back(1);
    v.push_back(2);
    v.push_back(5);
    v.push_back(9);
    v.push_back(9);

    
    int result = solution(v, 5);
    
    cout << result << endl;
    
    return 0;
}












































