import 'dart:collection';
class Solution {
  bool containsCycle(List<List<String>> grid) {
    final n = grid.length, m = grid[0].length;
    final dir = [(-1, 0), (0, 1), (1, 0), (0, -1)];
    final visit = <int>{};
    final parent = List.generate(n * m, (i) => i);
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        final cur = i * m + j;
        if (visit.contains(cur)) continue;
        final q = Queue<int>()..add(cur);
        while (q.isNotEmpty){
          final c = q.removeFirst();
          if (visit.contains(c)) continue;
          visit.add(c);
          final y = c ~/ m, x = c % m;
          for (final (dy, dx) in dir){
            final ny = y + dy, nx = x + dx;
            if (ny < 0 || ny >= n) continue;
            if (nx < 0 || nx >= m) continue;
            final next = ny * m + nx;
            if (visit.contains(next)) continue;
            if (grid[y][x] != grid[ny][nx]) continue;
            final a = find(parent, c);
            final b = find(parent, next);
            if (a == b) return true;
            union(parent, a, b);
          }
        }
      }
    }
    return false;
  }
  int find(List<int> parent, int child){
    if (parent[child] != child){
      parent[child] = find(parent, parent[child]);
    }
    return parent[child];
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
}