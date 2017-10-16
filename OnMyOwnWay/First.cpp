//
//  BaeMin_First.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 14..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
using namespace std;

int solution(vector<int> &A) {
    map<int, int> hMap;
    map<int, int>::iterator hIt;
    
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        hMap[A[i]] += 1;
    }
    
    // 찾기
    for(int i = 1; i < numeric_limits<int>::max(); i++) {
        if(hMap.find(i) == hMap.end()) {
            return i;
        }
    }
    
    
    return 0;
}

int main() {
    
    vector<int> v;
    v.push_back(0);
    v.push_back(-2);
    v.push_back(2);
    
    int result = solution(v);
    cout << result << endl;
    
    return 0;
}
