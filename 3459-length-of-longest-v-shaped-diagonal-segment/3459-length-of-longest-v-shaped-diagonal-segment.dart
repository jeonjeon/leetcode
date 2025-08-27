import 'dart:math';
import 'dart:collection';
class Solution {
  int lenOfVDiagonal(List<List<int>> grid) {
    final m = grid.length, n = grid[0].length;
    // tr, br, bl, tl
    final dir = [(-1, 1), (1, 1), (1, -1), (-1, -1)];
    final dp = List.generate(m, (_) => List.generate(n, (_) => List.filled(4, 0)));
    // [y, x, cnt, dir]
    final q = Queue<List<int>>();
    for (int i = 0; i < m; i++){
      // left
      int cnt = 1;
      if (grid[i][0] == 1) cnt = 0;
      q.add([i, 0, cnt, 0]);
      q.add([i, 0, cnt, 1]);
      // right
      cnt = 1;
      if (grid[i][n - 1] == 1) cnt = 0;
      q.add([i, n - 1, cnt, 2]);
      q.add([i, n - 1, cnt, 3]);
    }
    for (int i = 0; i < n; i++){
      // top
      int cnt = 1;
      if (grid[0][i] == 1) cnt = 0;
      q.add([0, i, cnt, 1]);
      q.add([0, i, cnt, 2]);
      // bot
      cnt = 1;
      if (grid[m - 1][i] == 1) cnt = 0;
      q.add([m - 1, i, cnt, 0]); 
      q.add([m - 1, i, cnt, 3]);
    }
    // [y, x, dir, cnt]
    while (q.isNotEmpty){
      final [y, x, cnt, di] = q.removeFirst();
      final (dy, dx) = dir[di];
      dp[y][x][di] = max(dp[y][x][di], cnt);
      final ny = y + dy, nx = x + dx;
      if (ny < 0 || ny >= m) continue;
      if (nx < 0 || nx >= n) continue;
      final nCnt = switch (grid[ny][nx]){
        1 => 0,
        _ when grid[y][x] == grid[ny][nx] => 1,
        _ => cnt + 1,
      };
      q.add([ny, nx, nCnt, di]);
    }
    // print(dp);
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (grid[i][j] != 1) continue; 
        for (int k = 0; k < 4; k++){
          q.add([i, j, 1, k]);
        }
      }
    }
    int res = min(1, q.length);
    while (q.isNotEmpty){
      final [y, x, cnt, di] = q.removeFirst();
      
      int ri = di - 1;
      if (ri < 0) ri += 4;
      res = max(res, cnt + dp[y][x][ri] - 1);
      // print('y: $y, x: $x, cnt: $cnt, di: $di, ri: $ri, res: $res');
      final (dy, dx) = dir[di];
      final ny = y + dy, nx = x + dx;
      if (ny < 0 || ny >= m) continue;
      if (nx < 0 || nx >= n) continue;
      if (grid[ny][nx] == 1 || grid[ny][nx] == grid[y][x]) continue;
      if (grid[y][x] == 1 && grid[ny][nx] == 0) continue;
      // print('y: $y, x: $x, (di: $di, dy: $dy, dx: $dx),  ny: $ny, nx: $nx, cnt: $cnt');
      q.add([ny, nx, cnt + 1, di]);
    }
    return res;
  }
}
// tr br bl tl
// [[2,2,0,2,0,2,0],
//  [1,2,2,1,0,2,0]]

// [[[1, 1, 1, 1], [1, 1, 1, 1], [2, 1, 1, 1], [1, 1, 1, 2], [1, 1, 1, 2], [2, 1, 1, 2], [2, 1, 1, 1]], 
// [[0, 0, 0, 0], [1, 1, 2, 1], [1, 1, 1, 1], [0, 0, 0, 0], [1, 2, 2, 1], [1, 2, 2, 1], [1, 2, 1, 1]]]