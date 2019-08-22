//
//  BaeMin_Three.cpp
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

// M: 5층, X: 최대 2명까지, Y: 최대 200kg 까지
int solution(vector<int> &A, vector<int> &B, int M, int X, int Y) {
    // Zero Exception
    if(A.size() == 0 || B.size() == 0) {
        return 0;
    }
    
    // 스탑 횟수
    int stopNumber = 0;
    // 현재 탑승해야할 사람의 번호
    int currRide = 0;
    
    // 현재 엘레베이터 탑승 인원들
    vector<int> nowElevator;
    // 현재 엘레베이터 무게
    int nowWeight = 0;
    
    
    // 언제까지? currRide == A.size() 까지
    while(currRide != A.size()) {
        // 1번 다 태움
        for(vector<int>::size_type i = currRide; i < A.size(); i++) {
            // 최대 인원까지 태운다
            if(nowElevator.size() <= X - 1) {
                // 최대 몸무게 제한까지 태운다
                if(nowWeight + A[i] <= Y) {
                    nowElevator.push_back(i);
                    nowWeight += A[i];
                    
                    currRide = i + 1;
                }else {
                    break;
                }
            }
        }
        
        // 다 태웠으면 출발
        // 내린곳 표시
        map<int, int> hMap;
        map<int, int>::iterator hIt;
        
        for(vector<int>::size_type q = 0; q < nowElevator.size(); q++) {
            // 단 인원이 같이 내리면 stop 1번으로 처리
            // 아직 안내린 곳이라면
            if(hMap.find(B[nowElevator[q]]) == hMap.end()) {
                // 해당 인원의 층수에 도달하면 stop +1
                stopNumber++;
                
                hMap[B[nowElevator[q]]] = 1;
            }else {
                // 이미 내린곳
            }
        }
        
        // 인원이 엘레베이터에서 다 내렸다면 복귀 stop +1
        stopNumber++;
        
        // 초기화
        nowElevator.clear();
        hMap.clear();
        nowWeight = 0;
    }
    
    
    return stopNumber;
}

int main() {
//    vector<int> A;
//    A.push_back(60);
//    A.push_back(80);
//    A.push_back(40);
//    
//    vector<int> B;
//    B.push_back(2);
//    B.push_back(3);
//    B.push_back(5);
//    
//    int M = 5;
//    int X = 2;
//    int Y = 200;
    
    vector<int> A;
    A.push_back(40);
    A.push_back(40);
    A.push_back(100);
    A.push_back(80);
    A.push_back(20);
    
    vector<int> B;
    B.push_back(3);
    B.push_back(3);
    B.push_back(2);
    B.push_back(2);
    B.push_back(3);
    
    int M = 3;
    int X = 5;
    int Y = 200;
    
    int result = solution(A, B, M, X, Y);
    
    cout << "result " << result << endl;
    
    return 0;
}





























