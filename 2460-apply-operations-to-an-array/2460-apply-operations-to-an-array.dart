class Solution {
  List<int> applyOperations(List<int> nums) {
    int l = 0, r = 0, n = nums.length;
    while (l < n){
      if (r == n) {
        nums[l] = 0;
        l++;
        continue;
      }
      nums[l] = nums[r];
      if (r < n - 1 && nums[r] == nums[r + 1]){
        nums[l] *= 2;
        nums[r + 1] = 0;
      }
      if (nums[l] > 0) l++;
      r++;
    }
    return nums;
  }
}