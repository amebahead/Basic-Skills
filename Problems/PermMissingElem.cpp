//
//  PermMissingElem.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 12..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/programmers/lessons/3-time_complexity/

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
using namespace std;

int solution(vector<int> &A) {
    long int aLen = A.size() + 1;
    long int totalSum = aLen * (aLen+1) / 2;
    
    // 토탈에서 값을 하나씩 뺀다
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        totalSum -= A[i];
    }
    
//    cout << "temp" << endl;
    
    return (int)totalSum;
}

int main() {
    
    vector<int> v;
    
    v.push_back(1);
    v.push_back(3);
    v.push_back(2);
    v.push_back(5);
    v.push_back(4);
    v.push_back(7);
    
    int result = solution(v);
    cout << result << endl;
    
    return 0;
}
