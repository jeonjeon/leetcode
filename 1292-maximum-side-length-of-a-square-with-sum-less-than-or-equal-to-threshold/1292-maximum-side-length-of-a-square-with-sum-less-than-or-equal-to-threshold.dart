import 'dart:math';
class Solution {
  int maxSideLength(List<List<int>> mat, int threshold) {
    int res = 0;
    final m = mat.length, n = mat[0].length;
    for (int i = 0; i < m; i++){
      for (int j = 1; j < n; j++){
        mat[i][j] += mat[i][j - 1];
      }
    }
    for (int len = min(m, n); len > 0; len--){
      // print('len: $len, m - len: ${m - len}, n - len: ${n - len}');
      for (int vs = 0; vs <= m - len; vs++){
        for (int hs = 0; hs <= n - len; hs++){
          // 여기서 부터 스퀘어 체크
          int sum = 0;
          for (int i = 0; i < len; i++){
            sum += mat[vs + i][hs + len - 1] - (hs == 0 ? 0 : mat[vs + i][hs - 1]);
            if (sum > threshold) break;
          }
          if (sum <= threshold) {
            return len;
          }
        }
      }
    }
    return 0;
  }
}