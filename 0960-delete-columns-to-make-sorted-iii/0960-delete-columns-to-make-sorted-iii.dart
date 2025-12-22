import 'dart:math';
class Solution {
  int minDeletionSize(List<String> strs) {
    if (strs[0].length == 1) return 0;
    int res = 0;
    final dp = List.filled(strs[0].length, 1);
    for (int i = 1; i < strs[0].length; i++){
      for (int j = 0; j < i; j++){
        bool inc = true;
        for (int k = 0; k < strs.length; k++){
          if (strs[k].codeUnitAt(j) > strs[k].codeUnitAt(i)){
            inc = false;
            break;
          }
        }
        if (inc) dp[i] = max(dp[i], dp[j] + 1);
        res = max(res, dp[i]);
      }
    }
    return strs[0].length - res;
  }
}