import 'dart:math';
class Solution {
  int binaryGap(int n) {
    int prev = -1, res = 0;
    for (int i = 0; i < 30; i++){
      if (n & (1 << i) == 0) continue;
      if (prev == -1){
        prev = i;
        continue;
      }
      res = max(res, i - prev);
      prev = i;
    }
    return res;
  }
}