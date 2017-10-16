//
//  BaeMin_One.cpp
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

int solution(string &S) {
    int sLen = S.size();
    int result = 0;
    
    // 2진수 - > 10진수
    int deciValue = 0;
    int multi = sLen - 1;
    
    for(int i = multi; i >= 0; i--) {
        int powValue = (int)pow(2, i);

        int convertInt = (int)S[multi - i] - 48;
        deciValue += powValue * (convertInt);
    }
    
    // Step
    while(deciValue > 0) {
        result++;
        
        // 짝수이면
        if(deciValue % 2 == 0) {
            deciValue = deciValue / 2;
        }else {
            // 홀수라면
            deciValue = deciValue - 1;
        }
    }
    
    return result;
}

int main() {
    
    string s = "011100";
    
    int r = solution(s);
    cout << r << endl;
    
    
    return 0;
}
























