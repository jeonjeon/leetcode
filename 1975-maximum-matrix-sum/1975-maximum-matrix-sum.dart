import 'dart:math';
class Solution {
  int maxMatrixSum(List<List<int>> matrix) {
    int mn = 100000, neg = 0, tot = 0;
    for (final mat in matrix){
      for (final m in mat){
        if (0 > m) neg++;
        final cur = m.abs();
        tot += cur;
        mn = min(mn, cur);
      }
    }
    // print('tot: $tot, neg: $neg, mn: $mn');
    if (neg % 2 == 0) return tot;
    return tot - mn * 2;
  }
}