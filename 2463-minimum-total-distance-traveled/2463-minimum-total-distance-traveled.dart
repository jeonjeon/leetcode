import 'dart:math';
class Solution {
  int minimumTotalDistance(List<int> rob, List<List<int>> fac) {
    rob.sort();
    fac.sort((a, b) => a[0].compareTo(b[0]));
    final dp = List.generate(fac.length + 1, (i) => List.generate(rob.length + 1, (j) => j == 0 ? 0 : 200000000900));
    for (int i = 1; i <= fac.length; i++){
      final [pos, lim] = fac[i - 1];
      for (int j = 1; j <= rob.length; j++){
        dp[i][j] = dp[i - 1][j];
        int dist = 0;
        for (int k = 1; k <= min(lim, j); k++){
          dist += (rob[j - k] - pos).abs();
          dp[i][j] = min(dp[i][j], dp[i - 1][j - k] + dist);
        }
      }
    }
    return dp.last.last;
  }
}