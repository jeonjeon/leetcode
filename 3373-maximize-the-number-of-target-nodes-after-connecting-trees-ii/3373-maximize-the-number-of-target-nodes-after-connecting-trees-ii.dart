import 'dart:math';
import 'dart:collection';
class Solution {
  List<int> maxTargetNodes(List<List<int>> edges1, List<List<int>> edges2) {
    // make edges to hash map
    final edg1 = <int, List<int>>{};
    final edg2 = <int, List<int>>{};
    for (final [a, b] in edges1){
      (edg1[b] ??= []).add(a);
      (edg1[a] ??= []).add(b);
    }
    for (final [a, b] in edges2){
      (edg2[b] ??= []).add(a);
      (edg2[a] ??= []).add(b);
    }
    final (res1, oddEven1) = bfs(edg1);
    final (res2, _) = bfs(edg2);
    final max2 = max(res2[0], res2[1]);
    final res = List.filled(edges1.length + 1, 0);
    for (int i = 0; i < res.length; i++){
      res[i] = res1[oddEven1[i]] + max2;
    }
    return res;
  }
  (List<int>, List<int>) bfs(Map<int, List<int>> edg){
    final oddEven = List.filled(edg.length + 1, 0);
    final res = List.filled(2, 0);
    var q = Queue<int>()..add(0);
    final visit = <int>{};
    int even = 0;
    while (q.isNotEmpty){
      final temp = Queue<int>();
      while (q.isNotEmpty){
        final cur = q.removeFirst();
        if (visit.contains(cur)) continue;
        visit.add(cur);
        oddEven[cur] = even;
        res[even]++;
        final next = edg[cur] ?? [];
        for (final n in next){
          if (visit.contains(n)) continue;
          temp.add(n);
        }
      }
      even = (even + 1) % 2;
      q = temp;
    }
    return (res, oddEven);
  }
}