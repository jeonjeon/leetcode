import 'dart:math';
class Solution {
  int minimumTeachings(int n, List<List<int>> lang, List<List<int>> friend) {
    int res = 500;
    final sets = lang.map((l) => l.toSet()).toList();
    final inter = friend.map((f) => sets[f[0] - 1].intersection(sets[f[1] - 1]).isNotEmpty).toList();
    // print(inter);
    for (int l = 1; l <= n; l++){
        int cur = 0;
        final visit = <int>{};
        for (int i = 0; i < inter.length; i++){
            if (inter[i]) continue;
            final a = friend[i][0];
            final b = friend[i][1];
            if (!visit.contains(a) && !sets[a - 1].contains(l)) {
                cur++;
                visit.add(a);
            }
            if (!visit.contains(b) && !sets[b - 1].contains(l)) {
                cur++;
                visit.add(b);
            }
        }
        res = min(res, cur);
    }
    return res;
  }
}