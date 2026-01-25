import 'dart:math';
class Solution {
  int minimumDifference(List<int> nums, int k) {
    int res = 100000;
    nums.sort();
    for (int i = k - 1; i < nums.length; i++){
      res = min(res, nums[i] - nums[i - k + 1]);
    }
    return res;
  }
}