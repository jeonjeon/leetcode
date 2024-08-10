import 'dart:collection';
class Solution {
  int regionsBySlashes(List<String> grid) {
    final dp = List.generate(grid.length * 3, (i) =>  List.filled(grid[0].length * 3, 0));
    int res = 0;
    for (int i = 0; i < grid.length; i++){
      for (int j = 0; j < grid[0].length; j++){
        if (grid[i][j] == ' ') continue;
        final di = i * 3;
        if (grid[i][j] == '\\'){
          dp[i * 3][j * 3] = 1;
          dp[i * 3 + 1][j * 3 + 1] = 1;
          dp[i * 3 + 2][j * 3 + 2] = 1;
          continue;
        }
        if (grid[i][j] == '/'){
          dp[i * 3][j * 3 + 2] = 1;
          dp[i * 3 + 1][j * 3 + 1] = 1;
          dp[i * 3 + 2][j * 3] = 1;
          continue;
        }
      }
    }
    // print(dp);
    for (int i = 0; i < dp.length; i++){
      for (int j = 0; j < dp[0].length; j++){
        if (dp[i][j] == 0){
          coloring(dp, i, j);
          res++;
        }
      }
    }
    return res;
  }
  void coloring(List<List<int>> dp, int i, int j){
    dp[i][j] = -1;
    // 위
    if (i > 0 && dp[i - 1][j] == 0) coloring(dp, i - 1, j);
    // 아래
    if (i < dp.length - 1 && dp[i + 1][j] == 0) coloring(dp, i + 1, j);
    // 왼
    if (j > 0 && dp[i][j - 1] == 0) coloring(dp, i, j - 1);
    // 오
    if (j < dp[0].length - 1 && dp[i][j + 1] == 0) coloring(dp, i, j + 1);
  }
}