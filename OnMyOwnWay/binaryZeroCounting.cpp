//
//  binaryZeroCounting.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 12..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/programmers/lessons/1-iterations/

#include <iostream>
#include <vector>
using namespace std;

int solution(int N) {
    
    vector<int> v;
    int count = 0;
    int MAXX = 0;
    
    while (N > 1) {
        int mod = N % 2;
        
        v.push_back(mod);
        N = (N - mod) / 2;
    }
    
    cout << "length " << v.size() << endl;
    
    // 0 갯수 카운트
    for(vector<int>::size_type i = 0; i < v.size(); ++i) {
        if(v[i] == 1) {
            count = 0;
        }else {
            count++;
            
            if(count > MAXX) {
                MAXX = count;
            }
        }
    }
    
    return MAXX;
}

int main() {
    
    int result = solution(529);
    cout << "result " << result << endl;
    
    return 0;
}













