import 'dart:math';
class Solution {
  int getMoneyAmount(int n) {
    final MAX = (n + 1) * n ~/ 2;
    final dp = List.generate(n + 1, (i) => List.generate(n + 1, (j) => i == 0 || j == 0 || i == j ? 0 : MAX));
    for (int i = 1; i <= n; i++){
      for (int j = 1; i + j <= n; j++){
        final s = j;
        final e = i + j;
        for (int k = s; k <= e; k++){
         //print('s: $s, e: $e, k: $k');
          final left = k == s ? 0 : dp[s][k - 1];
          final right = k == e ? 0 : dp[k + 1][e];
          dp[j][i + j] = min(dp[j][i + j], k + max(left, right));
        }
        //print('s: $s, e: $e, dp[j][i + j]: ${dp[j][i + j]}');
      }
    }
    return dp[1].last;
  }
}