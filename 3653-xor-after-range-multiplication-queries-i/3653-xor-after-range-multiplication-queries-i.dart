class Solution {
  int xorAfterQueries(List<int> nums, List<List<int>> queries) {
    final mod = 1000000007;
    for (final [l, r, k, v] in queries){
      for (int i = l; i <= r; i += k){
        nums[i] = (nums[i] * v) % mod;
      }
    }
    return nums.reduce((a, b) => a ^ b);
  }
}