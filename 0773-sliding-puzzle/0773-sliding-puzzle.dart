import 'dart:math';
class Solution {
    final mx = 1000000000;
    final ans = '123450';
    final visit = <String, int>{};
    final dir = [(-1, 0), (1, 0), (0, -1), (0, 1)];
  int slidingPuzzle(List<List<int>> board) {
    final res = recur(0, board);
    if (res == mx) return -1;
    return res;
  }
  int recur(int step, List<List<int>> b){
    int res = mx;
    // print(visit);
    final v = b.expand((a) => a).map((a) => '$a').join('');
    if ((visit[v] ?? res) <= step){
        return res;
    }
    if (v == ans){
        return step;
    }
    visit[v] = step;
    int y = 0, x = 0;
    for (int i = 0; i < 2; i++){
        for (int j = 0; j < 3; j++){
            if (b[i][j] == 0) {
                y = i;
                x = j;
            }
        }
    }
    for (final (dy, dx) in dir){
        final ny = y + dy, nx = x + dx;
        if (ny < 0 || ny >= 2 || nx < 0 || nx >= 3){
            continue;
        }
        b[y][x] = b[ny][nx];
        b[ny][nx] = 0;
        res = min(res, recur(step + 1, b));
        b[ny][nx] = b[y][x];
        b[y][x] = 0;
    }
    return res;
  }
}