//
//  FrogJmp.cpp
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
#include <cmath>
using namespace std;

int solution(int X, int Y, int D) {
    // Double Casting
    double dX = (double)X;
    double dY = (double)Y;
    double dD = (double)D;
    
    // No Jump Eception
    if(dX >= dY) {
        return 0;
    }
//    cout << (dY-dX) / dD << endl;
    double x = ceil((dY-dX) / dD);
    
//    cout << x << endl;
    
    return (int)x;
}

int main() {
    
    int result = solution(10, 85, 30);
    
    cout << "result " << result << endl;
    
    return 0;
}
