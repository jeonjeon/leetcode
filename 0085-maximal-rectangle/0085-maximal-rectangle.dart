import 'dart:math';
class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    int res = 0;
    final m = matrix.length, n = matrix[0].length;
    final prefix = List.generate(m, (_) => List.filled(n, 0));
    for (int i = 0; i < m; i++){
      for (int j = 0; j < n; j++){
        if (matrix[i][j] == '0') continue;
        prefix[i][j] = 1;
        if (j == 0) continue;
        prefix[i][j] += prefix[i][j - 1];
      }
    }
    // print(prefix);
    for (int j = 0; j < n; j++){
      final stack = <List<int>>[];
      for (int i = 0; i < m; i++){
        final cur = prefix[i][j];
        int tot = 0;
        while (stack.isNotEmpty && stack.last.first >= cur){
          final [col, cnt] = stack.removeLast();
          tot += cnt;
          res = max(res, col * tot);
        }
        stack.add([cur, tot + 1]);
        // print('i: $i, j: $j, tot: $tot, cur: $cur');
      }
      int tot = 0;
      while (stack.isNotEmpty){
        final [col, cnt] = stack.removeLast();
        tot += cnt;
        res = max(res, col * tot);
      }
      // print(stack);
    }
    return res;
  }
}