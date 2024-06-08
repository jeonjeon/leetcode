class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    final ps = <int>{};
    int sum = nums.first % k;
    int prev = sum;
    for (int i = 1; i < nums.length; i++){
      sum = (sum + nums[i]) % k;
      if (sum == 0 || ps.contains(sum)){
        return true;
      }
      ps.add(prev);
      prev = sum;
    }
    return false;
  }
}