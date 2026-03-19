class Solution {
  int numberOfSubmatrices(List<List<String>> grid) {
    int res = 0;
    final n = grid.length, m = grid[0].length;
    final mat = List.generate(n, (_) => List.generate(m, (_) => List.filled(2, 0)));
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        if (grid[i][j] == 'X'){
          mat[i][j][0]++;
        } else if (grid[i][j] == 'Y'){
          mat[i][j][1]++;
        }
        if (j > 0) {
          mat[i][j][0] += mat[i][j - 1][0];
          mat[i][j][1] += mat[i][j - 1][1];
        }
      }
    }
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        if (i > 0){
          mat[i][j][0] += mat[i - 1][j][0];
          mat[i][j][1] += mat[i - 1][j][1];
        }
        if (mat[i][j][0] == 0) continue;
        if (mat[i][j][0] == mat[i][j][1]) res++;
      }
    }
    return res;
  }
}