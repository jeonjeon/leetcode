import 'dart:math';
class Solution {
  int maxSumTrionic(List<int> nums) {
    int n = nums.length;
    int res = -1 << 52;
    int preSum = nums[0];

    int l = 0, p = 0, q = 0;
    for (int r = 1; r < n; r++) {
      preSum += nums[r];
      // 같으면 무조건 아웃
      if (nums[r - 1] == nums[r]) {
        l = r;
        preSum = nums[r];
        continue;
      } 
      // 극점
      if (nums[r - 1] > nums[r]) {
        if (r > 1 && nums[r - 2] < nums[r - 1]){
          p = r - 1;
          while (l < q) preSum -= nums[l++];
          while (l + 1 < p && nums[l] < 0) preSum -= nums[l++];
        }
        continue;
      }  
      if (r > 1 && nums[r - 2] > nums[r - 1]) {
        q = r - 1;
      }
      if (l < p && p < q) {
        res = max(res, preSum);
      }
    }
    return res;
  }
}