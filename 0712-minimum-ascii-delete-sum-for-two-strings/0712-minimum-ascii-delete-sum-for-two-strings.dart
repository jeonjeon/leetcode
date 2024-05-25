import 'dart:math';
class Solution {
  int minimumDeleteSum(String s1, String s2) {
    final arr1 = s1.split('').map((a)=> a.codeUnitAt(0)).toList();
    final arr2 = s2.split('').map((a)=> a.codeUnitAt(0)).toList();
    final every = arr1.reduce((a,b) => a + b) + arr2.reduce((a, b) => a + b);
    final dp = List.generate(s1.length + 1, (_) => List.filled(s2.length + 1, every));
    for (int i = 1; i < dp.length; i++){
      for (int j = 1; j < dp[0].length; j++){
        if (arr1[i - 1] == arr2[j - 1]){
          dp[i][j] = min(dp[i][j], dp[i - 1][j - 1] - arr1[i - 1] - arr2[j - 1]);
          continue;
        }
        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]);
      }
    }
    return dp.last.last;
  }
}