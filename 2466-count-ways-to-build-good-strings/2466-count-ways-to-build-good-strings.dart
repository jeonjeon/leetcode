import 'dart:math';
class Solution {
  // tile problem
  int countGoodStrings(int low, int high, int zero, int one) {
    int res = 0;
    final MOD = 1000000007;
    final dp = List.filled(high + 1, 0);
    dp[0] = 1;
    for (int i = 1; i < dp.length; i++){
      if (i >= zero){
        dp[i] = (dp[i] + dp[i - zero]) % MOD;
      }
      if (i >= one){
        dp[i] = (dp[i] + dp[i - one]) % MOD;
      }
      if (i >= low){
        res = (res + dp[i]) % MOD;
      }
    }
    return res ;
  }
}