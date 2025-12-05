class Solution {
  int countPartitions(List<int> nums) {
    final sum = nums.reduce((a, b) => a + b);
    if (sum % 2 == 0) return nums.length - 1;
    return 0;
  }
}