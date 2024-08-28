import 'dart:collection';
class Solution {
  final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
  int countSubIslands(List<List<int>> grid1, List<List<int>> grid2) {
    int res = 0;
    for (int i = 0; i < grid2.length; i++){
      for (int j = 0; j < grid2[0].length; j++){
        // if current point at grid2 is a land check whether subisland of grid1 or not.
        if (grid2[i][j] == 1 && isSubIsland(grid1, grid2, i, j)) {
          res++;
        }
      }
    }
    return res;
  }

  // BFS
  bool isSubIsland(List<List<int>> grid1, List<List<int>> grid2, int i, int j){
    final q = Queue<(int, int)>();
    grid2[i][j] = 0;
    q.add((i, j));
    bool res = grid1[i][j] == 1;
    while (q.isNotEmpty){
      final (y, x) = q.removeFirst();
      for (final (dy, dx) in dir){
        final ny = y + dy;
        final nx = x + dx;
        if (0 > ny || ny >= grid2.length || 0 > nx || nx >= grid2[0].length) continue;
        if (grid2[ny][nx] == 0) continue;
        res = res && grid1[ny][nx] == 1;
        grid2[ny][nx] = 0;
        q.add((ny, nx));
      }
    }
    return res;
  }
}