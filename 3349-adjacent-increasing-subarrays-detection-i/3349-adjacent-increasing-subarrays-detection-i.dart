class Solution {
  bool hasIncreasingSubarrays(List<int> nums, int k) {
    if (k == 1) return true;
    final prefix = List.filled(nums.length, 1);
    for (int i = 1; i < nums.length; i++){
        if (nums[i] > nums[i - 1]){
            prefix[i] += prefix[i - 1];
        }
    }
    for (int i = k - 1; i < nums.length - k; i++){
        if (prefix[i] >= k && prefix[i + k] >= k) return true;
    }
    return false;
  }
}