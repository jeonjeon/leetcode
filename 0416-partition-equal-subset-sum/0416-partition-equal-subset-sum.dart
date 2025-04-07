class Solution {
  bool canPartition(List<int> nums) {
    final sum = nums.reduce((a, b) => a + b);
    if (sum % 2 == 1) return false;
    final half = sum ~/ 2;
    var dp = List.filled(half + 1, false);
    dp[0] = true;
    for (int i = 0; i < nums.length; i++){
      final temp = List.filled(half + 1, false);
      temp[0] = true;
      for (int j = 0; j <= half; j++){
        if (!dp[j]) continue;
        temp[j] = true;
        if (j + nums[i] > half) break;
        temp[j + nums[i]] = true;
      }
      dp = temp;
    }
    return dp[half];
  }
}