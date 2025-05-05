class Solution {
  int numTilings(int n) {
    if (n == 1) return 1;
    final dp = List.filled(n + 1, 1);
    dp[1] = 1;
    dp[2] = 2;
    for (int i = 3; i <= n; i++){
      dp[i] = 2 * dp[i - 1] + dp[i - 3];
      dp[i] %= 1000000007;
    }
    return dp.last;
  }
}