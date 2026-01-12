import 'dart:math';
class Solution {
  int minTimeToVisitAllPoints(List<List<int>> points) {
    int res = 0;
    for (int i = 1; i < points.length; i++){
      final [x1, y1] = points[i - 1];
      final [x2, y2] = points[i];
      final hori = (x2 - x1).abs();
      final vert = (y2 - y1).abs();
      res += max(hori, vert);
    }
    return res;
  }
}