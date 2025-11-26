class Solution {
  int numberOfPaths(List<List<int>> grid, int k) {
    final mod = 1000000007;
    final m = grid.length, n = grid[0].length;
    final dp = List.generate(m, (_) => List.generate(n, (_) => List.filled(k, 0)));
    dp[0][0][grid[0][0] % k] = 1;
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (i > 0){
          for (int l = 0; l < k; l++){
            if (dp[i - 1][j][l] == 0) continue;
            final cur = (l + grid[i][j]) % k;
            dp[i][j][cur] = (dp[i][j][cur] + dp[i - 1][j][l]) % mod;
          }
        }
        if (j > 0){
          for (int l = 0; l < k; l++){
            if (dp[i][j - 1][l] == 0) continue;
            final cur = (l + grid[i][j]) % k;
            dp[i][j][cur] = (dp[i][j][cur] + dp[i][j - 1][l]) % mod;
          }
        }
      }
    }
    return dp.last.last.first;
  }
}