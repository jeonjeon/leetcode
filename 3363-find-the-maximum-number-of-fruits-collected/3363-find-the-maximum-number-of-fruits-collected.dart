class Solution {
  int maxCollectedFruits(List<List<int>> A) {
  int n = A.length;
  
  // Set inaccessible cells to 0
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < n; ++j) {
      if (i < j && j < n - 1 - i) {
        A[i][j] = 0;
      }
      if (j < i && i < n - 1 - j) {
        A[i][j] = 0;
      }
    }
  }
  
  // First child
  int res = 0;
  for (int i = 0; i < n; ++i) {
    res += A[i][i];
  }
  
  // Second child
  for (int i = 1; i < n; ++i) {
    for (int j = i + 1; j < n; ++j) {
      A[i][j] += [
        A[i - 1][j - 1],
        A[i - 1][j],
        (j + 1 < n) ? A[i - 1][j + 1] : 0
      ].reduce((a, b) => a > b ? a : b);
    }
  }
  
  // Third child
  for (int j = 1; j < n; ++j) {
    for (int i = j + 1; i < n; ++i) {
      A[i][j] += [
        A[i - 1][j - 1],
        A[i][j - 1],
        (i + 1 < n) ? A[i + 1][j - 1] : 0
      ].reduce((a, b) => a > b ? a : b);
    }
  }
  
  return res + A[n - 1][n - 2] + A[n - 2][n - 1];
}
}