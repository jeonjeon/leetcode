class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    final ps = <int>{};
    int sum = nums.first;
    int prev = sum % k;
    for (int i = 1; i < nums.length; i++){
      sum += nums[i];
      final mod = sum % k;
      if (mod == 0 || ps.contains(mod)){
        return true;
      }
      ps.add(prev);
      prev = mod;
    }
    return false;
  }
}