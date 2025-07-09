import 'dart:math';
class Solution {
  int maxFreeTime(int evt, int k, List<int> s, List<int> e) {
    final len = s.length;
    int size = List.generate(k, (i) => e[i] - s[i]).reduce((a, b) => a + b);
    if (k == len) return max(0, evt - size);
    int res = min(evt, s[k]) - size;
    int l = 0;
    // print('res: $res, size: $size');
    for (int r = k; r < len; r++){
        size += e[r] - s[r];
        size -= e[l] - s[l];
        l++;
        final el = e[l - 1];
        final er =  r == len - 1 ? evt : s[r + 1];
        res = max(res, er - el - size);
        // print('l: $l, r: $r, el: $el, er: $er, size: $size, res: $res');
    }
    return res;
  }
}