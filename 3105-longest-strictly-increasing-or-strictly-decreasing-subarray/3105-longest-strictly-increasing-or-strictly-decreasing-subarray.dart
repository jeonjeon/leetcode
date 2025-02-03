import 'dart:math';
class Solution {
  int longestMonotonicSubarray(List<int> nums) {
    int res = 1;
    int inc = 1;
    int dec = 1;
    for (int i = 1; i < nums.length; i++){
      if (nums[i] > nums[i - 1]){
        inc++;
      } else {
        inc = 1;
      }
      if (nums[i] < nums[i - 1]){
        dec++;
      } else {
        dec = 1;
      }
      res = max(res, max(inc, dec));
    }
    return res;
  }
}