import 'dart:math';
class Solution {
  int maxScore(String s) {
    int res = 0;
    int zeros = 0;
    int ones = s.split('').where((ss) => ss == '1').length;
    for (int i = 0; i < s.length - 1; i++){
        if (s[i] == '1'){
            ones--;
        } else {
            zeros++;
        }
        res = max(res, ones + zeros);
    }
    return res;
  }
}