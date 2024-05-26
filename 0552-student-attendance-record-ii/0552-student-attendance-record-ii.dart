class Solution {
  static const int MOD = 1000000007;

  int checkRecord(int n) {
    if (n == 0) return 1;
    
    // dp[i][j][k]: length i, with j 'A's, ending with k consecutive 'L's
    List<List<List<int>>> dp = List.generate(n + 1, 
      (_) => List.generate(2, (_) => List.filled(3, 0)));

    dp[0][0][0] = 1;

    for (int i = 1; i <= n; i++) {
      for (int j = 0; j < 2; j++) {
        for (int k = 0; k < 3; k++) {
          // Add 'P'
          dp[i][j][0] = (dp[i][j][0] + dp[i - 1][j][k]) % MOD;
          // Add 'A'
          if (j > 0) {
            dp[i][j][0] = (dp[i][j][0] + dp[i - 1][j - 1][k]) % MOD;
          }
          // Add 'L'
          if (k > 0) {
            dp[i][j][k] = (dp[i][j][k] + dp[i - 1][j][k - 1]) % MOD;
          }
        }
      }
    }

    int result = 0;
    for (int j = 0; j < 2; j++) {
      for (int k = 0; k < 3; k++) {
        result = (result + dp[n][j][k]) % MOD;
      }
    }

    return result;
  }
}