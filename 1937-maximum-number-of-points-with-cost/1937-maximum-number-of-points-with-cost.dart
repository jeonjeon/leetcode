import 'dart:math';
class Solution {
  int maxPoints(List<List<int>> p) {
    final n = p.length;
    final m = p[0].length;
    for (int i = 1; i < n; i++){
      final left = List<int>.from(p[i - 1]);
      final right = List<int>.from(p[i - 1]);
      for (int j = 1; j < m; j++){
        left[j] = max(left[j], left[j - 1] - 1);
        right[m - j - 1] = max(right[m - j - 1], right[m - j] - 1);
      }
      for (int j = 0; j < m; j++){
        p[i][j] += max(left[j], right[j]);
      }
    }
    return p.last.reduce(max);
  }
}