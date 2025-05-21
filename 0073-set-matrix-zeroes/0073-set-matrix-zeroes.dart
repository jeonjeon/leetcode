class Solution {
  void setZeroes(List<List<int>> matrix) {
    final col = List.filled(matrix.length, false);
    final row = List.filled(matrix[0].length, false);
    for (int i = 0; i < matrix.length; i++){
      for (int j = 0; j < matrix[0].length; j++){
        if (matrix[i][j] != 0) continue;
        col[i] = true;
        row[j] = true;
      }
    }
    for (int i = 0; i < matrix.length; i++){
      for (int j = 0; j < matrix[0].length; j++){
        if (col[i]) matrix[i][j] = 0;
        if (row[j]) matrix[i][j] = 0;
      }
    }
  }
}