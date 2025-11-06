import 'dart:collection';
class Solution {
  List<int> processQueries(int c, List<List<int>> conn, List<List<int>> quer) {
    final parent = List.generate(c + 1, (i) => i);
    for (final [x, y] in conn){
        union(x, y, parent);
    }
    final grid = <int, SplayTreeSet<int>>{};
    for (int i = 1; i <= c; i++){
        final p = find(i, parent);
        (grid[p] ??= SplayTreeSet<int>()).add(i);
    }
    final res = <int>[];
    for (final [q, t] in quer){
        final group = grid[find(t, parent)]!;
        if (q == 1){
            if (group.contains(t)) res.add(t);
            else res.add(group.firstOrNull ?? -1);
        } else {
            group.remove(t);
        }
    }
    // print(grid);
    return res;
  }
  int find(int x, List<int> parent){
    if (parent[x] != x) parent[x] = find(parent[x], parent);
    return parent[x];
  }
  void union(int x, int y, List<int> parent){
    x = find(x, parent);
    y = find(y, parent);
    if (x < y){
        parent[y] = x;
        return;
    }
    parent[x] = y;
  }
}