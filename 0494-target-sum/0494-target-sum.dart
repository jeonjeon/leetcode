class Solution {
  int findTargetSumWays(List<int> nums, int target) {
    var dp = <int, int>{};
    dp[-nums.first] = (dp[-nums.first] ?? 0) + 1;
    dp[nums.first] = (dp[nums.first] ?? 0) + 1;
    for (int i = 1; i < nums.length; i++){
        final cur = nums[i];
        final temp = <int, int>{};
        for (final e in dp.entries){
            temp[e.key + cur] = (temp[e.key + cur] ?? 0) + e.value;
            temp[e.key - cur] = (temp[e.key - cur] ?? 0) + e.value;
        }
        dp = temp;
    }
    return dp[target] ?? 0;
  }
}