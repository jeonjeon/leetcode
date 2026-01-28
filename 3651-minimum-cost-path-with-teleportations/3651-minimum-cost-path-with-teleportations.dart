import 'dart:math';
class Solution {
  int minCost(List<List<int>> grid, int k) {
    final m = grid.length, n = grid[0].length;
    final cost = List.generate(m, (i) => List.filled(n, 64000000));
    // 정상루트
    cost[0][0] = 0;
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (i > 0){
          cost[i][j] = min(cost[i][j], grid[i][j] + cost[i - 1][j]);
        }
        if (j > 0){
          cost[i][j] = min(cost[i][j], grid[i][j] + cost[i][j - 1]);
        }
      }
    }
    // 텔레포트 추가
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        for (int k = 0; k < m; k++){
          for (int l = 0; l < n; l++){
            if (grid[k][l] > grid[i][j]) continue;
            if (cost[k][l] <= cost[i][j]) continue;
            cost[k][l] = cost[i][j];
          }
        }
      }
    }
    // 정상루트
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (i > 0){
          cost[i][j] = min(cost[i][j], grid[i][j] + cost[i - 1][j]);
        }
        if (j > 0){
          cost[i][j] = min(cost[i][j], grid[i][j] + cost[i][j - 1]);
        }
      }
    }
    // print(cost);
    return cost.last.last;
  }
}