import 'dart:math';

class Solution {
  int maximumAmount(List<List<int>> coins) {
    int n = coins.length, m = coins[0].length;
    const int NEG_INF = -1000000000;
    
    // 3D DP 배열 초기화
    List<List<List<int>>> dp = List.generate(
      n, (_) => List.generate(
        m, (_) => List.filled(3, NEG_INF)
      )
    );
    
    dp[0][0][0] = coins[0][0];
    dp[0][0][1] = 0;
    dp[0][0][2] = 0;
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        for (int k = 0; k < 3; k++) {
          if (i > 0) {
            dp[i][j][k] = max(dp[i][j][k], dp[i-1][j][k] + coins[i][j]);
          }
          if (i > 0 && k > 0) {
            dp[i][j][k] = max(dp[i][j][k], dp[i-1][j][k-1]);
          }
          if (j > 0) {
            dp[i][j][k] = max(dp[i][j][k], dp[i][j-1][k] + coins[i][j]);
          }
          if (j > 0 && k > 0) {
            dp[i][j][k] = max(dp[i][j][k], dp[i][j-1][k-1]);
          }
        }
      }
    }
    
    return dp[n-1][m-1].reduce(max);
  }
}