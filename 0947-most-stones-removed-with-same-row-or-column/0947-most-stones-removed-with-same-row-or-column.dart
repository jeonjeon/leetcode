import 'dart:collection';
class Solution {
  int removeStones(List<List<int>> stones) {
    int res = stones.length;
    final hori = <int, Set<int>>{};
    final vert = <int, Set<int>>{};
    for (int i = 0; i < stones.length; i++){
      final s = stones[i];
      (hori[s[0]] ??= {}).add(i);
      (vert[s[1]] ??= {}).add(i);
    }
    final parent = List.generate(stones.length, (i) => i);
    for (int i = 0; i < stones.length; i++){
      for (final h in hori[stones[i][0]]!){
        union(parent, i, h);
      }
      for (final v in vert[stones[i][1]]!){
        union(parent, i, v);
      }
    }
    final remains = parent.map((p) => find(parent, p)).toSet().length;
    return stones.length - remains;
  }
  int find(List<int> parent, int a){
    if (parent[a] != a){
      parent[a] = find(parent, parent[a]);
    }
    return parent[a];
  }
  void union(List<int> parent, int a, int b){
    a = find(parent, a);
    b = find(parent, b);
    if (a < b) {
      parent[b] = a;
    } else {
      parent[a] = b;
    }
  }
}
