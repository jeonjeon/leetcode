import 'dart:math';
class Solution {
  int minExtraChar(String s, List<String> d) {
    final dict = d.toSet();
    final dp = List.generate(s.length + 1, (i) => i);
    for (int i = 1; i < dp.length; i++){
      for (int j = i - 1; j >= 0; j--){
        if (dict.contains(s.substring(j, i))){
          dp[i] = min(dp[i], dp[j]);
        } else {
          dp[i] = min(dp[i], dp[j] + i - j);
        }
      }
    }
    return dp.last;
  }
}