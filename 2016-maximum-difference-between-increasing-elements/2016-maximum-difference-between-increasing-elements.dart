import 'dart:math';
class Solution {
  int maximumDifference(List<int> nums) {
    int mn = 1000000000, res = -1;
    for (final n in nums){
      if (n > mn) res = max(res, n - mn);
      mn = min(mn, n);

    }
    return res;
  }
}