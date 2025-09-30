class Solution {
  int triangularSum(List<int> nums) {
    if (nums.length == 1) return nums.first;
    final res = <int>[];
    for (int i = 0; i < nums.length - 1; i++){
        res.add((nums[i] + nums[i + 1]) % 10);
    }
    return triangularSum(res);
  }
}