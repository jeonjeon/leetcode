import 'package:collection/collection.dart';
class Solution {
  int trapRainWater(List<List<int>> high) {
    int res = 0;
    final dir = [(0, 1), (0, -1), (1, 0), (-1, 0)];
    final m = high.length, n = high[0].length;
    final visit = <(int, int)>{};
    final pq = PriorityQueue<(int,int)>((a, b) => high[a.$1][a.$2].compareTo(high[b.$1][b.$2]));
    for (int i = 0; i < m; i++){
      final left = (i, 0), right = (i, n - 1);
      pq.add(left);
      pq.add(right);
      visit.add(left);
      visit.add(right);
    }
    for (int i = 0; i < n; i++){
      final top = (0, i), bot = (m - 1, i);
      pq.add(top);
      pq.add(bot);
      visit.add(top);
      visit.add(bot);
    }
    int highest = 0;
    while (pq.isNotEmpty){
      final (y, x) = pq.removeFirst();
      highest = max(highest, high[y][x]);
      for (final (dy, dx) in dir){
        final ny = y + dy, nx = x + dx;
        if (ny < 0 || ny >= m) continue;
        if (nx < 0 || nx >= n) continue;
        if (visit.contains((ny, nx))) continue;
        res += max(0, highest - high[ny][nx]);
        pq.add((ny, nx));
        visit.add((ny, nx));
      }
    }
    return res;
  }
}