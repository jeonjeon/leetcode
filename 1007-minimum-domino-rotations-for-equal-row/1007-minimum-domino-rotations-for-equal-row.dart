import 'dart:math';
class Solution {
  int minDominoRotations(List<int> top, List<int> bot) {
    int res = top.length + 1;
    for (int d = 1; d < 7; d++){
      res = min(res, rotation(d, top, bot));
    }
    if (res > top.length) return -1;
    return res;
  }
  int rotation(int d, List<int> top, List<int> bot){
    int t = 0, b = 0;
    for (int i = 0; i < top.length; i++){
      if (top[i] != d && bot[i] != d) return top.length + 1;
      if (top[i] == d && bot[i] == d) continue;
      if (top[i] != d){
        t++;
        continue;
      }
      b++;
    }
    return min(t, b);
  }
}