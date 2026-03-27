class Solution {
  bool areSimilar(List<List<int>> mat, int k) {
    final n = mat.length, m = mat[0].length;
    int op = 1;
    for (int i = 0; i < n; i++){
      op *= -1;
      for (int j = 0; j < m; j++){
        int nj = (j + k * op + m) % m;
        if (mat[i][j] != mat[i][nj]) return false;
      }
    }
    return true;
  }
}