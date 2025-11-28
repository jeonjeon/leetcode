import 'dart:collection';
class Solution {
  int maxKDivisibleComponents(int n, List<List<int>> edges, List<int> values, int k) {
    if (n == 1) return 1;
    // edges to hash map
    final hm = <int, List<int>>{};
    for (final [e1, e2] in edges){
      (hm[e1] ??= []).add(e2);
      (hm[e2] ??= []).add(e1);
    }
    // nodes with in-degree 1
    final q = Queue<int>.from(
      hm.entries.where((e) => e.value.length == 1)
                .map((e) => e.key)
    );
    // valid node set
    final valid = <int>{};
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      if (values[cur] % k == 0){
        valid.add(cur);
      }
      // pass the node has no edges
      if (hm[cur]!.length != 1) continue;
      final next = hm[cur]!.first;
      values[next] += values[cur] % k;
      // remove edge between cur and next nodes
      hm[next]!.remove(cur);
      hm[cur]!.remove(next);
      q.add(next);
    }
    // count of valid nodes
    return valid.length;
  }
}