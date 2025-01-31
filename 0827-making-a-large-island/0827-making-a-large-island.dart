import 'dart:math';
import 'dart:collection';
class Solution {
  int largestIsland(List<List<int>> grid) {
    final total = grid.expand((a) => a).reduce((a, b) => a + b);
    if (total == grid.length * grid[0].length) return total;
    if (total == 0) return 1;
    final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
    final union = [0, 0];
    void bfs(int i, int j){
        final q = Queue<(int, int)>()..add((i, j));
        int sum = 0;
        while (q.isNotEmpty){
            final (y, x) = q.removeFirst();
            if (grid[y][x] != 1) continue;
            sum += grid[y][x];
            grid[y][x] = union.length;
            for (final (dy, dx) in dir){
                final ny = y + dy, nx = x + dx;
                if (ny < 0 || ny >= grid.length) continue;
                if (nx < 0 || nx >= grid[0].length) continue;
                if (grid[ny][nx] != 1) continue;
                q.add((ny, nx));
            }
        }
        union.add(sum);
    }
    for (int i = 0; i < grid.length; i++){
        for (int j = 0; j < grid[0].length; j++){
            if (grid[i][j] == 1) bfs(i, j);
        }
    }
    int res = 0;
    for (int i = 0; i < grid.length; i++){
        for (int j = 0; j < grid[0].length; j++){
            if (grid[i][j] == 0) {
                final visit = <int>{};
                int sum = 1;
                for (final (dy, dx) in dir){
                    final ny = i + dy, nx = j + dx;
                    if (ny < 0 || ny >= grid.length) continue;
                    if (nx < 0 || nx >= grid[0].length) continue;
                    if (grid[ny][nx] == 0) continue;
                    if (visit.contains(grid[ny][nx])) continue;
                    visit.add(grid[ny][nx]);
                    sum += union[grid[ny][nx]];
                }
                res = max(res, sum);
            }
        }
    }
    // print(grid);
    // print(union);
    return res;
  }
}