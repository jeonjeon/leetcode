import 'dart:math';
class Solution {
  int countSquares(List<List<int>> matrix) {
    for (int i = 1; i < matrix.length; i++){
      for (int j = 1; j < matrix.first.length; j++){
        if (matrix[i][j] == 0) continue;
        matrix[i][j] += min(min(matrix[i - 1][j], matrix[i - 1][j - 1]), matrix[i][j - 1]);
      }
    }
    return matrix.expand((a) => a).reduce((a,b) => a + b);
  }
}