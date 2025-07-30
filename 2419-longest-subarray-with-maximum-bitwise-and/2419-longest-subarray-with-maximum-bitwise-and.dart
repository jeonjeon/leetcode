import 'dart:math';
class Solution {
  int longestSubarray(List<int> nums) {
    int res = 0, mx = 0, cnt = 0;
    for (final n in nums){
      if (mx == n) {
        cnt++;
      } else if (mx > n){
        cnt = 0;
      } else {
        mx = n;
        cnt = 1;
        res = 1;
      }
      res = max(res, cnt);
    }
    return res;
  }
}