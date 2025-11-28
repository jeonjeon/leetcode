import 'dart:collection';
class Solution {
  int maxKDivisibleComponents(int n, List<List<int>> edges, List<int> values, int k) {
    if (n == 1) return 1;
    int res = 0;
    final hm = <int, List<int>>{};
    final visit = <int>{};
    for (final [e1, e2] in edges){
      (hm[e1] ??= []).add(e2);
      (hm[e2] ??= []).add(e1);
    }
    final q = Queue<int>.from(
      hm.entries.where((e) => e.value.length == 1)
                .map((e) => e.key)
    );
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      // if (visit.contains(cur)) continue;
      if (!visit.contains(cur) && values[cur] % k == 0){
        res++;
        visit.add(cur);
        // print('cur: $cur, res: $res');
      }
      if (hm[cur]!.length != 1) continue;
      final next = hm[cur]!.first;
      values[next] += values[cur] % k;
      // values[cur] = 0;
      hm[next]!.remove(cur);
      hm[cur]!.remove(next);
      q.add(next);
      // print('cur: $cur, next: $next, values: $values');
    }
    // print(hm);
    // print(q);
    return res;
  }
}