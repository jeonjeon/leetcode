import 'dart:math';
class Solution {
  int numberOfWays(int n, int x) {
    final mod = 1000000007;
    var dp = List.filled(n + 1, 0);
    dp[0] = 1;
    for (int i = 1; i <= n; i++){
      final cur = pow(i, x).toInt();
      final temp = List<int>.from(dp);
      if (cur > n) break;
      for (int j = 0; j <= n; j++){
        if (cur + j > n) break;
        if (dp[j] == 0) continue;
        temp[cur + j] = (temp[cur + j] + dp[j]) % mod;
      }
      dp = temp;
    }
    return dp.last;
  }
}