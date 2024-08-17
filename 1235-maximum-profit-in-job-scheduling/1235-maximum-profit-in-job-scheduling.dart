import 'dart:math';
class Solution {
  int jobScheduling(List<int> s, List<int> e, List<int> p) {
    final n = s.length;
    final zip = <(int,int,int)>[];
    final dp = <int>[0];
    for (int i = 0; i < n; i++){
      zip.add((s[i], e[i], p[i]));
    }
    zip.sort((a, b) => a.$2.compareTo(b.$2));
    print(zip);
    // dp 
    for (final (st, ed, pf) in zip){
      // binary search
      int l = 0, r = dp.length - 1;
      while (l <= r){
        final mid = (l + r) ~/ 2;
        if (zip[mid].$2 <= st){
          l = mid + 1;
        } else {
          r = mid - 1;
        }
      }
      final cur = pf + (r >= 0 && zip[r].$2 <= st ? dp[r + 1] : 0);
      // print('r: $r, cur: $cur, dp: $dp');
      dp.add(max(dp.last, cur));
    }
    return dp.last;
  }
}