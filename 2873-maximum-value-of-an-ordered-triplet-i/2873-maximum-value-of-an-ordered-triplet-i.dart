import 'dart:math';
class Solution {
  int maximumTripletValue(List<int> nums) {
    int mx = 0, mxDiff = 0, res = 0;
    for (final n in nums){
      res = max(res, mxDiff * n);
      mxDiff = max(mxDiff, mx - n);
      mx = max(mx, n);
    }
    return res;
  }
}