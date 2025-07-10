import 'dart:math';
class Solution {
  int maxFreeTime(int evt, List<int> s, List<int> e) {
    int res = 0;
    var left = <int>[s.first];
    var right = <int>[evt - e.last];
    for (int i = 1; i < s.length; i++){
      left.add(max(left.last, s[i] - e[i - 1]));
      right.add(max(right.last, s[s.length - i] - e[s.length - i - 1]));
    }
    right = right.reversed.toList();
    // print('left: $left, right: $right');
    for (int i = 0; i < s.length; i++){
      int size = e[i] - s[i];
      final ls = i == 0 ? 0 : left[i - 1];
      final rs = i == s.length - 1 ? 0 : right[i + 1];
      final space = max(ls, rs);
      if (space >= size) size = 0;
      final lm = i == 0 ? 0 : e[i - 1];
      final rm = i == s.length - 1 ? evt : s[i + 1];
      res = max(res, rm - lm - size);
    }
    return res;
  }
}