import 'dart:math';
class Solution {
  int longestSubarray(List<int> nums) {
    int maxx = 0, cnt = 0, res = 0;
    for (final n in nums){
      if (n > maxx){
        res = 0;
        cnt = 1;
        maxx = n;
      } else if (n < maxx){
        cnt = 0;
      } else {
        cnt++;
      }
      res = max(res, cnt);
    }
    return res;
  }
}