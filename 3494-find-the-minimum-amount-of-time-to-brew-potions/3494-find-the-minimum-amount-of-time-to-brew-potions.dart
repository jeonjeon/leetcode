import 'dart:math';
class Solution {
  int minTime(List<int> skill, List<int> mana) {
    final n = skill.length, m = mana.length;
    var dp = List.filled(n + 1, 0);
    for(int i = 0; i < m; i++){
      final mn = mana[i];
      final newDp = List.filled(n + 1, 0);
      for (int j = 1; j <= n; j++) newDp[j] = max(dp[j], newDp[j - 1]) + skill[j - 1] * mn;
      for (int j = n - 1; j >= 1; j--) newDp[j] = newDp[j + 1] - skill[j] * mn;
      dp = newDp;
    }
    return dp.last;
  }
}