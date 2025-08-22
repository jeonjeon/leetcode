import 'dart:math';
class Solution {
  int minimumArea(List<List<int>> grid) {
    int y1 = 1000, y2 = 0, x1 = 1000, x2 = 0;
    for (int i = 0; i < grid.length; i++){
        for (int j = 0; j < grid[0].length; j++){
            if (grid[i][j] == 0) continue;
            y1 = min(y1, i);
            y2 = max(y2, i);
            x1 = min(x1, j);
            x2 = max(x2, j);
        }
    }
    if (y1 == 1000 || x1 == 1000) return 0;
    return (y2 - y1 + 1) * (x2 - x1 + 1);
  }
}