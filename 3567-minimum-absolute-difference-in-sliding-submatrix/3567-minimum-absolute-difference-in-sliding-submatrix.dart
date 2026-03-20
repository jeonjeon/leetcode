import 'dart:math';
import 'dart:collection';
class Solution {
  List<List<int>> minAbsDiff(List<List<int>> grid, int k) {
    final n = grid.length, m = grid[0].length;
    final res = List.generate(n - k + 1, (_) => List.filled(m - k + 1, 0));
    for (int i = 0; i <= n - k; i++){
      for (int j = 0; j <= m - k; j++){
        final sts = SplayTreeSet<int>();
        for (int dy = 0; dy < k; dy++){
          for (int dx = 0; dx < k; dx++){
            final y = i + dy, x = j + dx;
            sts.add(grid[y][x]);
          }
        }
        int diff = 200000;
        int prev = sts.first;
        sts.remove(prev);
        if (sts.isEmpty){
          diff = 0;
        }
        while (sts.isNotEmpty){
          final cur = sts.first;
          sts.remove(cur);
          diff = min(diff, cur - prev);
          prev = cur;
        }
        res[i][j] = diff;
      }
    }
    return res;
  }
}