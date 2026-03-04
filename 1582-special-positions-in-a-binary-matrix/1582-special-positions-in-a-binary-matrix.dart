class Solution {
  int numSpecial(List<List<int>> mat) {
    int res = 0;
    final n = mat.length, m = mat[0].length;
    final row = List.filled(n, 0);
    final col = List.filled(m, 0);
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        final cur = mat[i][j];
        row[i] += cur;
        col[j] += cur;
      }
    }
    for (int i = 0; i < n; i++){
      for (int j = 0; j < m; j++){
        final cur = mat[i][j];
        if (cur == 0) continue;;
        if (row[i] == 1 && col[j] == 1) res++;
      }
    }
    return res;
  }
}