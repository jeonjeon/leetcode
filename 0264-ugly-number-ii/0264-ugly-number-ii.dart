import 'dart:collection';
class Solution {
  int nthUglyNumber(int n) {
    final sts = SplayTreeSet<int>((a, b) => a.compareTo(b));
    int cur = 1;
    sts.add(1);
    for (int i = 0; i < n; i++){
      cur = sts.first;
      sts.remove(cur);
      sts.add(cur * 2);
      sts.add(cur * 3);
      sts.add(cur * 5);
    }
    return cur;
  }
}