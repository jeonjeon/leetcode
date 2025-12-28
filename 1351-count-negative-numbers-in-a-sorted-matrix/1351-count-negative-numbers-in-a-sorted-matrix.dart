class Solution {
  int countNegatives(List<List<int>> grid) {
    final m = grid.length, n = grid[0].length;
    int res = 0, j = n - 1;
    for (int i = 0; i < m; i++){
      while (j >= 0){
        if (grid[i][j] >= 0) break;
        j--;
      }
      res += n - 1 - j;
    }
    return res; 
  }
}