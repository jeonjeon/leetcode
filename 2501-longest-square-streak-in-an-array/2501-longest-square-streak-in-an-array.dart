import 'dart:collection';
import 'dart:math';
class Solution {
  int longestSquareStreak(List<int> nums) {
    final sts = SplayTreeSet<int>.from(nums);
    final lim = sqrt(sts.last).ceil();
    int res = 1;
    for (final n in sts){
      int cur = n;
      int cnt = 1;
      while (cur <= lim && sts.contains(cur * cur)){
        cnt++;
        cur *= cur;   
      }
    //   print('n: $n, cnt: $cnt, lim: $lim');
      res = max(res, cnt);
    }
    if (res == 1) return -1;
    return res;
  }
}