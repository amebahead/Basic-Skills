//
//  BaeMin_Two.cpp
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

#include <string>
#include <sstream>
#include <iterator>
using namespace std;

int main() {
    
    string sentence = "string to split \n party to night \n hello man";
    istringstream iss(sentence);
    
    // copy(istream_iterator<string>(iss), istream_iterator<string>(), ostream_iterator<string>(cout, "\n"));
    
    vector<string> words;
    copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter(words));
    
    cout << "size: " << words.size() << endl;
    for(vector<string>::size_type i = 0; i < words.size(); i++) {
        cout << words[i] << endl;
    }
    
    cout << "hello" << endl;
    
    return 0;
}






















