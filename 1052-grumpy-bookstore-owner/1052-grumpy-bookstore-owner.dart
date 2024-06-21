import 'dart:math';
class Solution {
  int maxSatisfied(List<int> c, List<int> g, int m) {
    int res = 0;
    int add = 0;
    int cur = 0;
    for (int i = 0; i < g.length; i++){
      if (g[i] == 0){
        res += c[i];
      } else {
        cur += c[i];
      }
      if (i >= m && g[i - m] == 1){
        cur -= c[i - m];
      }
      add = max(add, cur);
    }
    return res + add;
  }
}