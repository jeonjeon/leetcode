import 'dart:math';
class Solution {
  int countCoveredBuildings(int n, List<List<int>> b) {
    int res = 0;
    final vert = <int, (int, int)>{};
    final hori = <int, (int, int)>{};
    for (final [x, y] in b){
      reset(vert, x, y);
      reset(hori, y, x);
    }
    for (final [x, y] in b){
      final (yLow, yHigh) = vert[x]!;
      final (xLow, xHigh) = hori[y]!;
      if (yLow < y && y < yHigh && xLow < x && x < xHigh){
        res++;
      }
    }
    return res;
  }
  void reset(Map<int, (int, int)> bound, int cur, int cross){
      var (mn, mx) = bound[cur] ?? (cross, cross);
      mn = min(mn, cross);
      mx = max(mx, cross);
      bound[cur] = (mn, mx);
  }
}