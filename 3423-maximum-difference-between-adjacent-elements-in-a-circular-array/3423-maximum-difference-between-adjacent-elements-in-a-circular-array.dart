import 'dart:math';
class Solution {
  int maxAdjacentDistance(List<int> nums) {
    int res = (nums.first - nums.last).abs();
    for (int i = 0; i < nums.length - 1; i++){
        res = max(res, (nums[i] - nums[i + 1]).abs());
    }
    return res;
  }
}