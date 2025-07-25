import 'dart:math';
class Solution {
  int maxSum(List<int> nums) {
    final pos = nums.where((n) => n > 0);
    if (pos.isEmpty) return nums.reduce(max);
    return pos.toSet().reduce((a, b) => a + b);
  }
}