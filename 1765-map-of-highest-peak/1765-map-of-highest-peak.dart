import 'dart:collection';
class Solution {
  List<List<int>> highestPeak(List<List<int>> w) {
    final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
    final n = w.length, m = w[0].length;
    final res = List.generate(n, (_) => List.filled(m, -1));
    var q = Queue<(int, int)>();
    for (int y = 0; y < n; y++){
        for (int x = 0; x < m; x++){
            if (w[y][x] == 1) {
                q.add((y, x));
                res[y][x] = 0;
            }
        }
    }
    int level = 1;
    while (q.isNotEmpty){
        final temp = Queue<(int, int)>();
        while (q.isNotEmpty){
            final (y, x) = q.removeFirst();
            for (final (dy, dx) in dir){
                final ny = y + dy;
                final nx = x + dx;
                if (ny < 0 || ny >= n) continue;
                if (nx < 0 || nx >= m) continue;
                if (res[ny][nx] != -1) continue;
                res[ny][nx] = level;
                temp.add((ny, nx));
            }
        }
        q = temp;
        level++;
    }
    return res;
  }
}