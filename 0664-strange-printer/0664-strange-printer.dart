import 'dart:math';
class Solution {
  int strangePrinter(String s) {
    final arr = s.split('');
    final n = arr.length;
    final dp = List.generate(n, (i) => List.generate(n, (j) => max(0, j - i + 1)));
    // print(dp);
    for (int l = 2; l <= n; l++){
      for (int s = 0; s <= n - l; s++){
        final e = s + l - 1;
        for (int mid = s; mid < s + l - 1; mid++){
          var cur = dp[s][mid] + dp[mid + 1][e] - (arr[mid] == arr[e] ? 1 : 0);
          // print('l: $l, s: $s, mid: $mid, e: $e, cur: $cur');
          dp[s][e] = min(dp[s][e], cur);
        }
      }
    }
    // print(dp);
    return dp.first.last;
  }
}