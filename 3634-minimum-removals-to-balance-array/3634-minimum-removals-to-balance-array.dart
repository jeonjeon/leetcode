import 'dart:math';
class Solution {
  int minRemoval(List<int> nums, int k) {
    nums.sort();
    int del = 0, l = 0;
    for (int r = 0; r < nums.length; r++){
      while (l < r && nums[l] * k < nums[r]) l++;
      del = max(del, r - l + 1);
    }
    return nums.length - del;
  }
}