import 'dart:math';
class Solution {
  int minimumDeleteSum(String s1, String s2) {
    final m = s1.length, n = s2.length;
    final arr1 = s1.codeUnits;
    final arr2 = s2.codeUnits;
    final tot = arr1.reduce((a, b) => a + b) + arr2.reduce((a, b) => a + b);
    final dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    for (int i = 1; i <= m; i++){
      for (int j = 1; j <= n; j++){
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
        if (arr1[i - 1] == arr2[j - 1]){
          dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + arr1[i - 1]);
        }
      }
    }
    return tot - dp.last.last * 2;
  }
}