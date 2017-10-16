//
//  TapeEquilibrium.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 10. 13..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Reference By https://codility.com/programmers/lessons/3-time_complexity/

#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
#include <limits>
using namespace std;

// Reference By https://codility.com/programmers/lessons/3-time_complexity/

int solution(vector<int> &A) {
    // 전체 합
    long int totalSum = 0;
    long int min = numeric_limits<int>::max();
    // 이전값
    long int lastest = 0;
    
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        totalSum += A[i];
    }
    
    // 한단계씩 나가면서 |해당값 - (전체값 - 해당값)| 에서 최소를 찾아 리턴
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        long int temp = 0;
        
        temp = abs((A[i] + lastest) - (totalSum - (A[i] + lastest)));
        
        if(min > temp) {
            min = temp;
        }
        
        lastest += A[i];
    }
    
    cout << min << endl;
    
    return (int)min;
}

int main() {
    
    vector<int> v;
    v.push_back(312);

    
    solution(v);
    
    return 0;
}
