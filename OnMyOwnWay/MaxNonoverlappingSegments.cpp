//
//  MaxNonoverlappingSegments.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 13..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/programmers/lessons/16-greedy_algorithms/

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
using namespace std;

int solution(vector<int> &A, vector<int> &B) {
    // Zero Eception
    if(A.size() == 0 || B.size() == 0) {
        return 0;
    }
    
    // 진짜 욕심부려서 처음부터 넣을 수 있는 것만 넣어보자
    int count = 1;
    int endLine = B[0];
    
    for(vector<int>::size_type i = 1; i < A.size(); i++) {
        if(A[i] > endLine) {
            count++;
            endLine = B[i];
        }
    }
    
//    cout << count << endl;
    
    return count;
}

int main() {
    
    vector<int> a;
    a.push_back(1);
    a.push_back(3);
    a.push_back(7);
    a.push_back(9);
    a.push_back(9);
    
    vector<int> b;
    b.push_back(5);
    b.push_back(6);
    b.push_back(8);
    b.push_back(9);
    b.push_back(10);
    
    solution(a, b);
    
    return 0;
}
