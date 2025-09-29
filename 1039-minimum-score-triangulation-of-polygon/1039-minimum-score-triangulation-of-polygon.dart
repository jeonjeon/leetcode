import 'dart:math';
class Solution {
  int minScoreTriangulation(List<int> val) {
    final len = val.length;
    final dp = List.generate(len, (_) => List.filled(len, 0));
    for (int s = 2; s < len; s++){
      for (int l = 0; l + s < len; l++){
        final r = l + s;
        dp[l][r] = 50000000;
        for (int c = l + 1; c < r; c++){
            dp[l][r] = min(dp[l][r], val[l] * val[c] * val[r] + dp[l][c] + dp[c][r]);
        }
      }
    }
    return dp.first.last;
  }
}