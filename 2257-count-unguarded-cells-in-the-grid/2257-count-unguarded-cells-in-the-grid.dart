class Solution {
  int countUnguarded(int m, int n, List<List<int>> guards, List<List<int>> walls) {
    final dir = [(0, -1), (0, 1), (-1, 0), (1, 0)];
    final grid = List.generate(m, (i) => List.filled(n, 0));
    guards.forEach((g) => grid[g[0]][g[1]] = -1);
    walls.forEach((w) => grid[w[0]][w[1]] = -1);
    for (final g in guards){
        final y = g[0], x = g[1];
        for (final (dy, dx) in dir){
            int ny = y + dy, nx = x + dx;
            while (ny >= 0 && ny < grid.length && nx >= 0 && nx < grid[0].length && grid[ny][nx] != -1){
                grid[ny][nx] = 1;
                ny += dy;
                nx += dx;
            }
        }
    }
    return grid.expand((g) => g)
               .where((g) => g == 0)
               .length;
  }
}