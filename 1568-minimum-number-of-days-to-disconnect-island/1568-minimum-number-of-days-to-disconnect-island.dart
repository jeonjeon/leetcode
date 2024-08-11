import 'dart:math';
class Solution {
  int minDays(List<List<int>> grid) {
    final lands = grid.expand((a) => a).reduce((a, b) => a + b);
    if (lands == 1) return 1;
    if (!isConnected(lands, grid)) return 0;
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j] == 0) continue;
        grid[i][j] = 0;
        if(!isConnected(lands - 1, grid)) return 1;
        grid[i][j] = 1;
      }
    }
    return 2;
  }
  bool isConnected(int lands, List<List<int>> grid){
    int ii = 0; 
    int jj = 0;
    for(int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j] == 1){
          ii = i;
          jj = j;
          final res = dfs(ii, jj, List<List<int>>.from(
    grid.map((list) => List<int>.from(list))
  ));
          // print('ii: $ii, jj: $jj, grid: $grid');
          // print('res: $res, land: $lands');
          return  res == lands;      
        }
      }
    }
    return false;
  }
  int dfs(int i, int j, List<List<int>> grid){
    int res = 1;
    grid[i][j] = 0;
    // 위
    if (i > 0 && grid[i - 1][j] == 1){
      res += dfs(i - 1, j, grid);
    } if (i < grid.length - 1 && grid[i + 1][j] == 1){
      res += dfs(i + 1, j, grid);
    } if (j > 0 && grid[i][j - 1] == 1){
      res += dfs(i, j - 1, grid);
    } if (j < grid[0].length - 1 && grid[i][j + 1] == 1){
      res += dfs(i, j + 1, grid);
    }
    return res;
  }

}
