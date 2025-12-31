import 'dart:collection';
class Solution {
  int latestDayToCross(int row, int col, List<List<int>> cells) {
    int l = 0, r = cells.length;
    while (l < r){
      final m = (l + r) ~/ 2;
      if (bs(row, col, cells, m)){
        l = m + 1;
      } else {
        r = m;
      }
    }
    return l - 1;
  }
  bool bs(int row, int col, List<List<int>> cells, int t){
    final dir = [[-1, 0], [0, 1], [1, 0], [0, -1]];
    final land = List.generate(row, (_) => List.filled(col, 0));
    for (int i = 0; i < t; i++){
      final [r, c] = cells[i];
      land[r - 1][c - 1] = 1;
    }
    final q = Queue<List<int>>();
    for (int i = 0; i < col; i++){
      if (land[0][i] == 0) q.add([0, i]);
    }
    while (q.isNotEmpty){
      final [r, c] = q.removeFirst();
      if (r == row - 1) return true;
      if (land[r][c] == 1) continue;
      land[r][c] = 1;
      for (final [dr, dc] in dir){
        final nr = r + dr;
        final nc = c + dc;
        if (nr < 0 || nr >= row) continue;
        if (nc < 0 || nc >= col) continue;
        if (land[nr][nc] == 1) continue;
        q.add([nr, nc]);
      }
    }
    return false;
  }
}