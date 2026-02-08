import 'dart:math';
class Solution {
  int minimumDeletions(String s) {
    if (s.length == 1) return 0;
    final dp = List.filled(s.length + 1, 0);
    int b = 0;
    for (int i = 0; i < s.length; i++){
      if (s[i] == 'a'){
        dp[i + 1] = min(dp[i] + 1, b);
        continue;
      }
      dp[i + 1] = dp[i];
      b++;
    }
    return dp.last;
  }
}