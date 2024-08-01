import 'dart:math';
class Solution {
  int largestSubmatrix(List<List<int>> matrix) {
    for (int i = 1; i < matrix.length; i++){
      for (int j = 0; j < matrix[0].length; j++){
        if (matrix[i][j] == 0) continue;
        matrix[i][j] += matrix[i - 1][j];
      }
    }
    // print(matrix);
    int res = 0;
    for (int i = 0; i < matrix.length; i++){
      matrix[i].sort((a, b) => b.compareTo(a));
      for (int j = 0; j < matrix[0].length; j++){
        res = max(res, (j + 1) * matrix[i][j]);
      }
    }
    return res;
  }
}