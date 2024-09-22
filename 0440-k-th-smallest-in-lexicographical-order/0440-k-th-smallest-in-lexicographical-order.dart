import 'dart:math';
class Solution {
  int findKthNumber(int n, int k) {
    var cur = 1;
    k--;
    while (k > 0){
      final step = calc(n, cur);
      // print(step);
      if (k >= step){
        k -= step;
        cur++;
      } else {
        cur *= 10;
        k--;
      }
    }
    return cur;
  }
  int calc(int n, int cur){
    int res = 0;
    int n1 = cur, n2 = cur + 1;
    while (n1 <= n){
      res += min(n + 1, n2) - n1;
      n1 *= 10;
      n2 *= 10;
    }
    return res;
  }
}