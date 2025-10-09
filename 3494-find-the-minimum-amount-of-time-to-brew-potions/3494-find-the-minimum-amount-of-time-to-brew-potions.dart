import 'dart:math';
class Solution {
  int minTime(List<int> skill, List<int> mana) {
    final m = skill.length, n = mana.length;
    final dp = List.generate(n, (_) => List.filled(m, 0));
    for(int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        final start =  max(i == 0 ? 0 : dp[i - 1][j], j == 0 ? 0 : dp[i][j - 1]);
        dp[i][j] = start + skill[j] * mana[i];
      }
      for (int j = m - 2; j >= 0; j--){
        dp[i][j] = dp[i][j + 1] - skill[j + 1] * mana[i];
      }
    }
    return dp.last.last;
  }
}