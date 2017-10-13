//
//  RotateArray.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 12..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/programmers/lessons/2-arrays/

#include <iostream>
#include <vector>
#include <map>
using namespace std;

vector<int> solution(vector<int> &A, int K) {
    int aLen = A.size();
    
    // is Empty
    if(aLen == 0) {
        return A;
    }
    
    // 회전수 정리;
    int rotation = K % aLen;
    
    // 앞으로 도는 것 저장
    vector<int> saveVector;
    vector<int>::iterator sIt;
    
    // 결과 벡터
    vector<int> resultVector;
    
    for(int i = 0; i < rotation; i++) {
        int pb = A[aLen-1-i];
        saveVector.push_back(pb);
    }
    
    // 회전수만큼 오른쪽으로
    for(int q = 0; q < aLen - rotation; q++) {
        resultVector.push_back(A[q]);
    }
    
    // 앞으로 도는 것 추가
    for(unsigned int sIt = 0; sIt < saveVector.size(); sIt++) {
        resultVector.insert(resultVector.begin(), saveVector[sIt]);
    }
    
//    cout << "temp" << endl;
    
    return resultVector;
}

int main() {
    
    vector<int> v;
    
    v.push_back(10);
    v.push_back(20);
    v.push_back(30);
    v.push_back(40);
    v.push_back(50);
    
    solution(v, 3);
    
    
    return 0;
}


























