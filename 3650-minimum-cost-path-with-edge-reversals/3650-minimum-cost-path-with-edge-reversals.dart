import 'dart:math';
import 'package:collection/collection.dart';
class Solution {
  final mx = 1000000000;
  int minCost(int n, List<List<int>> edges) {
    final edg = <int, List<List<int>>>{};
    for (final [u, v, w] in edges){
      (edg[u] ??= []).add([v, w]);
      (edg[v] ??= []).add([u, w * 2]);
    }
    final arr = List.filled(n, mx);
    final q = PriorityQueue<(int, int)>((a, b) => a.$2.compareTo(b.$2));
    q.add((0, 0));
    while (q.isNotEmpty){
      final (cur, w) = q.removeFirst();
      if (arr[cur] <= w) continue;
      arr[cur] = w;
      if (!edg.containsKey(cur)) continue;
      for (final [n, nW] in edg[cur]!){
        if (arr[n] <= arr[cur] + nW) continue;
        q.add((n, arr[cur] + nW));
      }
    }
    return arr.last == mx ? -1 : arr.last;
  }
}