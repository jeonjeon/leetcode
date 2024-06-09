import 'dart:math';
class Solution {
  int minimumDeleteSum(String s1, String s2) {
    final n1 = s1.length + 1;
    final n2 = s2.length + 1;
    final dp = List.generate(n1, (_) => List.filled(n2, 0));
    for (int i = 1; i < n1; i++){
      dp[i][0] = dp[i - 1][0] + s1.codeUnitAt(i - 1);
    }
    for (int i = 1; i < n2; i++){
      dp[0][i] = dp[0][i - 1] + s2.codeUnitAt(i - 1);
    }
    for(int i = 1; i < n1; i++){
      for (int j = 1; j < n2; j++){
        if (s1[i - 1] == s2[j - 1]){
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] = min(dp[i - 1][j] + s1.codeUnitAt(i - 1), dp[i][j - 1] + s2.codeUnitAt(j - 1));
        }
      }
    }
    return dp.last.last;
  }
}
//[
//  [0, 101, 198, 314],
// [115, 202, 295, 430],
// [216, 115, 392, 546],
// [313, 216, 115, 662]
//]