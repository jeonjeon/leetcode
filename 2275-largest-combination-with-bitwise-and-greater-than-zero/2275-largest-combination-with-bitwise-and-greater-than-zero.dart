import 'dart:math';
class Solution {
  int largestCombination(List<int> candidates) {
    int res = 0;
    for (int i = 0; i < 25; i++){
      int cnt = 0;
      for (final c in candidates){
        if (c & 1 << i > 0) cnt++;
      }
      res = max(res, cnt);
    }
    return res;
  }
}