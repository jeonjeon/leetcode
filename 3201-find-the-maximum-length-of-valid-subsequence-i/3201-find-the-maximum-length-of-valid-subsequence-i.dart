import 'dart:math';
class Solution {
  int maximumLength(List<int> nums) {
    final cnt = List.filled(3, 0);
    cnt[nums.first % 2]++;
    cnt[2]++;
    for (int i = 1; i < nums.length; i++){
      final mod = nums[i] % 2;
      cnt[mod]++;
      if (nums[i - 1] % 2 != mod){
        cnt[2]++;
      }
    }
    return cnt.reduce(max);
  }
}