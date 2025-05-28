import 'dart:math';
import 'dart:collection';
class Solution {
  List<int> maxTargetNodes(List<List<int>> edges1, List<List<int>> edges2, int k) {
    final e1 = <int, List<int>>{};
    final e2 = <int, List<int>>{};
    for (final [a, b] in edges1){
      (e1[a] ??= []).add(b);
      (e1[b] ??= []).add(a);
    }
    for (final [a, b] in edges2){
      (e2[a] ??= []).add(b);
      (e2[b] ??= []).add(a);
    }
    int max2 = 0;
    for (int i = 0; i < edges2.length + 1; i++){
      max2 = max(max2, getMaxConn(e2, k - 1, i));
    }
    final res = <int>[];
    for (int i = 0; i < edges1.length + 1; i++){
      final max1 = getMaxConn(e1, k, i);
      // print('max1: $max1, max2: $max2');
      res.add(max1 + max2);
    }
    return res;
  }
  int getMaxConn(Map<int, List<int>> edges, int k, int start){
    int res = 0;
    final visit = <int>{};
    var q = Queue<int>()..add(start);
    while (k >= 0 && q.isNotEmpty){
      final temp = Queue<int>();
      while (q.isNotEmpty){
        final cur = q.removeFirst();
        if (visit.contains(cur)) continue;
        visit.add(cur);
        res++;
        final next = edges[cur] ?? [];
        for (final n in next){
          if (visit.contains(n)) continue;
          temp.add(n);
        }
      }
      // print('start: $start, temp: $temp, k: $k');
      q = temp;
      k--;
    }
    return res;
  }
}