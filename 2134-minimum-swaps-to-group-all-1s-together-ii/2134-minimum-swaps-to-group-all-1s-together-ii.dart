import 'dart:math';
class Solution {
  int minSwaps(List<int> nums) {
    final ones = nums.where((n) => n == 1).length;
    final zeros = nums.length - ones;
    return min(sliding(1, ones, nums), sliding(0, zeros, nums));
  }
  int sliding(int target, int size, List<int> nums){
    int res = nums.length;
    int cur = nums.take(size).where((n) => n != target).length;
    for (int i = size; i < nums.length; i++){
      if (nums[i] != target) cur++;
      if (nums[i - size] != target) cur--;
      res = min(res, cur);
    }
    // print('target: $target, size: $size, nums: $nums, res: $res');
    return res;
  }
}