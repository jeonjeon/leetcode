class Solution {
  int maxMoves(List<List<int>> grid) {
    final dp = List.generate(grid.length, (i) => List.generate(grid[0].length,(j) => j == 0));
    for (int i = 0; i < grid[0].length -1; i++){
        for (int j = 0; j < grid.length; j++){
            if (dp[j][i]){
                final di = i + 1;
                for (int d = -1; d < 2; d++){
                    final dj = j + d;
                    if (dj < 0 || dj >= grid.length || dp[dj][di]) continue;
                    if (grid[dj][di] > grid[j][i]){
                        dp[dj][di] = true;
                    }
                }
            }
        }
    }
    for (int i = grid[0].length - 1; i >= 0; i--){
        for (int j = 0; j < grid.length; j++){
            if (dp[j][i]){
                return i;
            }
        }
    }
    return 0;
  }
}