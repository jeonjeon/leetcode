class Solution {
  int res = 0;
  int minOperations(List<int> nums) {
    for (int i = 0; i < nums.length - 2; i++){
      if (nums[i] == 1) continue;
      for (int j = 0; j < 3; j++){
        nums[i + j] ^= 1;
      }
      res++;
    }
    // print(nums);
    if (nums.any((n) => n == 0)) return -1;
    return res;
  }
}