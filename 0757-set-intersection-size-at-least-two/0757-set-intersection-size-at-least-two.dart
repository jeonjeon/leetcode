import 'dart:collection';
class Solution {
  int intersectionSizeTwo(List<List<int>> itv) {
    final done = <int>{};
    final sts = SplayTreeSet<int>((a, b) => b.compareTo(a));
    itv.sort((a, b){
        final [s1, e1] = a;
        final [s2, e2] = b;
        if (e1 == e2) return s1.compareTo(s2);
        return e1.compareTo(e2);
    });
    sts.add(itv[0][1] - 1);
    sts.add(itv[0][1]);
    // print(itv);
    // print(sts);
    for (int i = 1; i < itv.length; i++){
        if (done.contains(i)) continue;
        final [s, e] = itv[i];
        final [last, last2] = sts.take(2).toList();
        // 둘다 있음
        if (s <= last && last <= e && s <= last2 && last2 <= e) {
        } else if (last < s){
            sts.add(e - 1);
            sts.add(e);
        } else if (last == e){
            sts.add(e - 1);
        } else {
            sts.add(e);
        }
        sts.add(last);
        sts.add(last2);
    }
    // print(sts);
    return sts.length;
  }
}