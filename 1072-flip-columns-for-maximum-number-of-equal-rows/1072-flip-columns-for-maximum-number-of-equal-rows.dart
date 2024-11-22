import 'dart:math';
class Solution {
  int maxEqualRowsAfterFlips(List<List<int>> matrix) {
    final hm = <String, int>{};
    for (final m in matrix){
        final s1 = StringBuffer(''), s2 = StringBuffer('');
        for (final s in m){
            s1.write('$s');
            s2.write('${s ^ 1}');
        }
        final ss1 = s1.toString();
        final ss2 = s2.toString();
        hm[ss1] = (hm[ss1] ?? 0) + 1;
        hm[ss2] = (hm[ss2] ?? 0) + 1;
    }
    return hm.values.reduce(max);
  }
}