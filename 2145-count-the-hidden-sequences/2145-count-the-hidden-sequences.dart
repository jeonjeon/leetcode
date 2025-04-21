import 'dart:math';
class Solution {
  int numberOfArrays(List<int> diff, int lower, int upper) {
    int cur = 0, mn = 0, mx = 0;
    for (final d in diff){
      cur += d;
      mn = min(mn, cur);
      mx = max(mx, cur);
    }
    return max(0, upper - lower - mx + mn + 1);
  }
}