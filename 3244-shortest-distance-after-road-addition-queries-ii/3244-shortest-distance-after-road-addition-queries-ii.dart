import 'dart:math';
class Solution {
  List<int> shortestDistanceAfterQueries(int n, List<List<int>> queries) {
    final hm = Map<int, int>.fromEntries(List.generate(n - 1, (i) => MapEntry(i, i + 1)));
    final res = <int>[];
    for (final q in queries){
      final s = q.reduce(min);
      final e = q.reduce(max);
      if (!hm.containsKey(s) || hm[s]! > e){
        res.add(hm.length);
        continue;
      }
      int i = hm[s]!;
      while (i < e){
        i = hm.remove(i)!;
      }
      hm[s] = e;
      res.add(hm.length);
    }
    return res;
  }
}