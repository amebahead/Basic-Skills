//
//  OddOccurrencesInArray.cpp
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

int solution(vector<int> &A) {
    
    // 맵에다 쌍으로 저장
    map<int, int> hMap;
    map<int, int>::iterator hIt;
    
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        hMap[A[i]] += 1;
    }
    
    // 모두 쌍쌍인지 체크, 홀수이면 리턴
    for(hIt = hMap.begin(); hIt != hMap.end(); hIt++) {
        if(hIt->second % 2 != 0) {
            return hIt->first;
        }
    }
    
    return 0;
}

int main() {
    
    vector<int> v;
    v.push_back(9);
    v.push_back(3);
    v.push_back(9);
    v.push_back(3);
    v.push_back(9);
    v.push_back(7);
    v.push_back(9);
    
    int result = solution(v);
    cout << result << endl;
    
    return 0;
}
