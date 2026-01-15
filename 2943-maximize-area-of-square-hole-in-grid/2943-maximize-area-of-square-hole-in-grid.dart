import 'dart:math';
class Solution {
  int maximizeSquareHoleArea(int n, int m, List<int> hBars, List<int> vBars) {
    final side = min(seq(hBars), seq(vBars)) + 1;
    return side * side;
  }
  int seq(List<int> arr){
    arr.sort();
    int res = 0, cnt = 0, prev = -1;
    for(final a in arr){
      if (prev + 1 == a) cnt++;
      else cnt = 1;
      prev = a;
      res = max(res, cnt);
    }
    return res;
  }
}