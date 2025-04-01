import 'dart:math';
class Solution {
  int mostPoints(List<List<int>> q) {
    final len = q.length;
    final dp = List.filled(len, 0);
    dp.last = q.last[0];
    for (int i = len - 2; i >= 0; i--){
      final [p, b] = q[i];
      dp[i] = p;
      if (i + b + 1 < len) dp[i] += dp[i + b + 1];
      dp[i] = max(dp[i], dp[i + 1]);
    }
    return dp.first;
  }
}