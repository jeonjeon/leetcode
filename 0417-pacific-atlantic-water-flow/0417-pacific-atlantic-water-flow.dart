import 'package:collection/collection.dart';
class Solution {
  List<List<int>> pacificAtlantic(List<List<int>> heights) {
    final res = <List<int>>[];
    final m = heights.length, n = heights[0].length;
    final mat = List.generate(m, (_) => List.filled(n, 0));
    // pacific
    final pq = PriorityQueue<(int, int)>((a, b) => heights[b.$1][b.$2].compareTo(heights[a.$1][a.$2]));
    for (int i = 0; i < m; i++) pq.add((i, 0));
    for (int i = 0; i < n; i++) pq.add((0, i));
    // print(pq);
    check(mat, heights, pq);
    // print(mat);
    // atlantic
    for (int i = 0; i < m; i++) pq.add((i, n - 1));
    for (int i = 0; i < n; i++) pq.add((m - 1, i));
    // print(pq);
    check(mat, heights, pq);
    // print(mat);
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (mat[i][j] < 2) continue;
        res.add([i, j]);
      }
    }
    return res;
  }
  void check(List<List<int>> mat, List<List<int>> heights, PriorityQueue<(int, int)> q){
    final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
    final visit = <(int, int)>{};
    while (q.isNotEmpty){
      final (y, x) = q.removeFirst();
      if (visit.contains((y, x))) continue;
      mat[y][x]++;
      visit.add((y, x));
      for (final (dy, dx) in dir){
        final ny = y + dy, nx = x + dx;
        if (ny < 0 || ny >= mat.length) continue;
        if (nx < 0 || nx >= mat[0].length) continue;
        if (heights[ny][nx] < heights[y][x]) continue;
        q.add((ny, nx));
      }
    }
  }
}