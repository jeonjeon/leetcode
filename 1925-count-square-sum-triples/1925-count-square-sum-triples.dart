import 'dart:math';
class Solution {
  int countTriples(int n) {
    int res = 0;
    for(int l = 1; l <= n; l++){
      final long = l * l;
      for (int m = 1; m < l; m++){
        final mid = m * m;
        for (int s = 1; s < l; s++){
          final short = s * s;
          if (mid + short != long) continue;
          if (long < mid + short) break;
          res++;
          // print('l: $l, m: $m, s: $s');
        }
      }
    }
    return res;
  }
}