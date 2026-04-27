import 'dart:collection';
class Solution {
  bool hasValidPath(List<List<int>> grid) {
    final n = grid.length, m = grid[0].length;
    final dir = [(-1, 0), (0, 1), (1, 0), (0, -1)];
    final paths = [{0, 0}, {3, 1}, {0, 2}, {3, 2}, {2, 1}, {3, 0}, {0, 1}];
    final visit = List.generate(n, (_) => List.filled(m, 0));
    final q = Queue<(int, int)>()..add((0, 0));
    while (q.isNotEmpty){
      final (y, x) = q.removeFirst();
      if (visit[y][x] == 1) continue;
      if (y == n - 1 && x == m - 1) return true;
      visit[y][x] = 1;
      final path = paths[grid[y][x]];
      for (final p in path){
        final (dy, dx) = dir[p];
        final ny = y + dy, nx = x + dx;
        if (ny < 0 || ny >= n) continue;
        if (nx < 0 || nx >= m) continue;
        if (visit[ny][nx] == 1) continue;
        if (paths[grid[ny][nx]].contains((p + 2) % 4)) {
          q.add((ny, nx));
        }
      }
      print(q);
    }
    return false;
  }
}