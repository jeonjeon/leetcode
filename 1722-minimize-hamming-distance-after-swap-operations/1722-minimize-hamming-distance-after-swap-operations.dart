import 'dart:math';
class Solution {
  int minimumHammingDistance(List<int> s, List<int> t, List<List<int>> all) {
    int same = 0;
    final n = s.length;
    final parent = List.generate(n, (i) => i);
    for (final [a, b] in all){
      union(parent, a, b);
    }
    final shm = <int, Map<int, int>>{};
    final thm = <int, Map<int, int>>{};
    for (int i = 0; i < n; i++){
      final child = find(parent, i);
      shm[child] ??= <int, int>{};
      thm[child] ??= <int, int>{};
      shm[child]![s[i]] = (shm[child]![s[i]] ?? 0) + 1;
      thm[child]![t[i]] = (thm[child]![t[i]] ?? 0) + 1;
    }
    for (final key in shm.keys){
      final ss = shm[key]!;
      final tt = thm[key]!;
      for (final k in ss.keys){
        same += min(ss[k] ?? 0, tt[k] ?? 0);
      }
    }
    return n - same;
  }
  void union(List<int> parent, int a, int b){
    a = find(parent, a);
    b = find(parent, b);
    if (a < b){
      parent[b] = a;
    } else {
      parent[a] = b;
    }
  }
  int find(List<int> parent, int child){
    if (parent[child] != child){
      parent[child] = find(parent, parent[child]);
    }
    return parent[child];
  }
}