//
//  TiedRopes.cpp
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

// Reference By https://codility.com/programmers/lessons/16-greedy_algorithms/

int solution(int K, vector<int> &A) {
    
    int count = 0;
    long int sumValue = 0;
    
    for(vector<int>::size_type i = 0; i < A.size(); i++) {
        sumValue += A[i];
        
        if(sumValue >= K) {
            count++;
            sumValue = 0;
        }
    }
    
//    cout << count << endl;
    
    return count;
}


int main() {
    
    vector<int> v;
    v.push_back(4);
    
    
    solution(4, v);
    
    return 0;
}
