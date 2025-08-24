import 'dart:math';
class Solution {
  int longestSubarray(List<int> nums) {
    int res = 0, l = 0, zero = 0;
    for (int r = 0; r < nums.length; r++){
        if (nums[r] == 0) zero++;
        while (l < r && zero > 1){
            if (nums[l++] == 0) zero--;
        }
        res = max(res, r - l);
    }
    return res;
  }
}