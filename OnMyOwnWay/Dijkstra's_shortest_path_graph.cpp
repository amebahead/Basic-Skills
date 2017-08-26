//
//  main.cpp
//  OnMyOwnWay
//
//  Created by Jun soo Song on 2017. 8. 27..
//  Copyright © 2017년 Jun soo Song. All rights reserved.
//

// Dijkstra Graph Distance
// Reference by https://www.youtube.com/watch?v=oDnh117Bzn4&list=PL52K_8WQO5oXTfEr3nVK3HllrB71hZ-AF&index=3

#include <iostream>
using namespace std;

int MAXX = 100000;

// ABCDEF : 012345
int GRAPH[6][6] = {
    {0, 1, MAXX, 2, 3, MAXX},
    {1, 0, 3, 4, MAXX, MAXX},
    {MAXX, 3, 0, 2, MAXX, MAXX},
    {2, 4, 2, 0, 4, 1},
    {3, MAXX, MAXX, 4, 0, 2},
    {MAXX, MAXX, MAXX, 1, 2, 0}
};

// 시작점의 가중치를 0으로 넣는다
int weightArr[6] = {0, MAXX, MAXX, MAXX, MAXX, MAXX};

// 0: 픽스X, 1: 픽스O
bool fixedArr[6] = {};

// 라운딩 함수
void roundFunc(int node) {
    int nowWeight = weightArr[node];
    
    for(int i = 0; i < 6; i++) {
        int brunch = GRAPH[node][i];
        
        if(brunch != MAXX) {
            if(weightArr[i] > nowWeight + brunch) {
                weightArr[i] = nowWeight + brunch;
            }
        }
    }
}

// 최소 가중치 찾아서 노드를 반환하는 함수
// 이미 픽스된 노드는 제외하고
int minWeightNode() {
    int minNum = MAXX;
    int minIndex = -1;
    
    for (int i = 0; i < 6; i++) {
        if(fixedArr[i] == false) {
            if(minNum > weightArr[i]) {
                minNum = fixedArr[i];
                minIndex = i;
            }
        }
    }
    
    return minIndex;
}

int main() {
    
    for(int i = 0; i < 6; i++) {
        int fixedNode = minWeightNode();
        // 최소 가중치인 노드는 픽스된 노드이다
        fixedArr[fixedNode] = true;
        
        roundFunc(fixedNode);
        
    }
    
    // 결과출력
    for(int j = 0; j < 6; j++) {
        cout << weightArr[j] << endl;
    }
    
    return 0;
}































































