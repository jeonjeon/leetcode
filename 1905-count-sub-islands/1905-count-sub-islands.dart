import 'dart:collection';
class Solution {
  int countSubIslands(List<List<int>> grid1, List<List<int>> grid2) {
    int res = 0;
    final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
    for (int i = 0; i < grid2.length; i++){
      for (int j = 0; j < grid2[0].length; j++){
        if (grid2[i][j] == 1) {
          final q = Queue<(int, int)>();
          grid2[i][j] = 0;
          q.add((i, j));
          bool isSub = grid1[i][j] == 1;
          while (q.isNotEmpty){
            final (y, x) = q.removeFirst();
            for (final (dy, dx) in dir){
              final ny = y + dy;
              final nx = x + dx;
              if (0 > ny || ny >= grid2.length || 0 > nx || nx >= grid2[0].length) continue;
              if (grid2[ny][nx] == 0) continue;
              isSub = isSub && grid1[ny][nx] == 1;
              grid2[ny][nx] = 0;
              q.add((ny, nx));
            }
          }
          if (isSub) res++;
        }
      }
    }
    return res;
  }
}