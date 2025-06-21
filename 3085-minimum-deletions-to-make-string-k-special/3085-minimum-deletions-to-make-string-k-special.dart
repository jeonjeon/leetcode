import 'dart:collection';
import 'dart:math';
class Solution {
  int minimumDeletions(String word, int k) {
    final l = word.length;
    final a = 'a'.codeUnitAt(0);
    final freq = List.filled(26, 0);
    final cnt = List.filled(l + 1, 0);
    word.split('').forEach((w) => freq[w.codeUnitAt(0) - a]++);
    freq.forEach((f) => cnt[f]++);
    // print(cnt);
    int r = 0, del = 0, delC = 0, res = l;
    for (int i = l; i > 0; i--){
      r += cnt[i] * i;
      int cur = l - r;
      del += delC;
      if (i + k <= l){
        delC += cnt[i + k];
      }
      cur += del;
      res = min(res, cur);
      // print('i: $i, res: $res, del: $del, r: $r');
    }
    return res;
  }
}
