import 'dart:math';
class Solution {
  int maxProfit(List<int> prc, List<int> stg, int k) {
    for (int i = 0; i < stg.length; i++){
      stg[i] *= prc[i];
      if (i > 0) {
        stg[i] += stg[i - 1];
        prc[i] += prc[i - 1];
      }
    }
    int res = stg.last;
    // print('stg: $stg');
    // print('prc: $prc');
    for (int i = k - 1; i < stg.length; i++){
      final left = i == k - 1 ? 0 : stg[i - k];
      final center = prc[i] - prc[i - k ~/ 2];
      final right = stg.last - stg[i];
      // print('i: $i, left: $left, center: $center, right: $right');
      res = max(res, left + center + right);
    }
    return res;
  }
}