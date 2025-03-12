import 'dart:math';
class Solution {
  int maximumCount(List<int> nums) {
    if (nums.first > 0 || nums.last < 0) return nums.length;
    final l = bs(nums, 0);
    final r = bs(nums, 1);
    // print('l: $l, r: $r, len: ${nums.length}');
    return max(l, nums.length - r);
  }
  int bs(List<int> nums, int target){
    int l = 0, r = nums.length;
    while (l < r){
        final m = (l + r) ~/ 2;
        if (nums[m] >= target){
            r = m;
        } else {
            l =  m + 1;
        }
    }
    return l;    
  }
}