import 'dart:math';
class Solution {
  final a = 'a'.codeUnitAt(0);
  int minimumCost(String source, String target, List<String> original, List<String> changed, List<int> cost) {
    final dp = List.generate(26, (i) => List.generate(26, (j) => i == j ? 0 : 1000000000));
    for (int i = 0; i < cost.length; i++){
      final org = original[i].codeUnitAt(0) - a;
      final cng = changed[i].codeUnitAt(0) - a;
      final cst = cost[i];
      dp[org][cng] = min(dp[org][cng], cst);
    }
    for (int i = 0; i < 26; i++){
      for (int j = 0; j < 26; j++){
        for (int k = 0; k < 26; k++){
          dp[j][k] = min(dp[j][k], dp[j][i] + dp[i][k]);
        }
      }
    }
    int res = 0;
    for (int i = 0; i < source.length; i++){
      final s = source.codeUnitAt(i) - a;
      final t = target.codeUnitAt(i) - a;

      if (dp[s][t] >= 1000000000) {
        return -1;
      }
      res += dp[s][t];
    }
    return res;
  }
}