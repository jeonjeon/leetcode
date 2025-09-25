import 'dart:math';
class Solution {
  int minimumTotal(List<List<int>> t) {
    for (int i = 1; i < t.length; i++){
      for (int j = 0; j < t[i].length; j++){
        var prev = 10000;
        if (j > 0){
          prev = min(prev, t[i - 1][j - 1]);
        }
        if (j < t[i - 1].length){
          prev = min(prev, t[i - 1][j]);
        }
        t[i][j] += prev;
      }
    }
    return t.last.reduce(min);
  }
}