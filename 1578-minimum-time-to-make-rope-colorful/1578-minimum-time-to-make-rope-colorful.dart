import 'dart:math';
class Solution {
  int minCost(String col, List<int> need) {
    int res = 0, last = 0;;
    for (int i = 1; i < col.length; i++){
      if (col[last] != col[i]) {
        last = i;
        continue;
      }
      if (need[i] < need[last]){
        res += need[i];
        continue;
      }
      res += need[last];
      last = i;
    }
    return res;
  }
}