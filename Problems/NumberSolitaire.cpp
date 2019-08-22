//
//  NumberSolitaire.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 13..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
using namespace std;

int solution(vector<int> &A) {
    int len = A.size();
    vector<long> memo(len, numeric_limits<long>::min());
    memo[0] = A[0];
    for (int i = 1; i < len; ++i)
    {
        for (int j = 1; j <7; ++j)
        {
            if (i - j >= 0)
                memo[i] = std::max(memo[i], A[i] + memo[i - j]);
        }
    }
    
    cout << memo[len - 1] << endl;;
    
    return memo[len - 1];
}

int main() {
    
    vector<int> v;
    v.push_back(1);
    v.push_back(-2);
    v.push_back(0);
    v.push_back(9);
    v.push_back(-1);
    v.push_back(-2);
    
    solution(v);
    
    return 0;
}
