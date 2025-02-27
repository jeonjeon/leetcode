import 'dart:math';
class Solution {
  // int lenLongestFibSubseq(List<int> arr) {
  //   final sett = arr.toSet();
  //   int res = 0;
  //   for (int i = 0; i < arr.length; i++){
  //     for (int j = i + 1; j < arr.length; j++){
  //       int x = arr[i], y = arr[j];
  //       int cnt = 0;
  //       while (sett.contains(x + y)){
  //         final next = x + y;
  //         x = y;
  //         y = next;
  //         cnt++;
  //       }
  //       if (cnt > 0) cnt += 2;
  //       res = max(res, cnt);
  //     }
  //   }
  //   return res;
  // }
  int lenLongestFibSubseq(List<int> arr) {
    final n = arr.length;
    final hm = <int, int>{};
    final dp = List.generate(n, (_) => List.filled(n, 0));
    int res = 0;
    for (int i = 0; i < n; i++){
      hm[arr[i]] = i;
      for (int j = 1; j < i; j++){
        if (arr[i] - arr[j] == arr[j]) continue;
        final idx = hm[arr[i] - arr[j]];
        if (idx != null){
          dp[i][j] = (dp[j][idx] == 0) ? 3 : dp[j][idx] + 1;
        }
        res = max(res, dp[i][j]);
      }
    }
    return res;
  }
}