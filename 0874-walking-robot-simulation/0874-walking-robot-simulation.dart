import 'dart:math';
import 'dart:collection';
class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    final hori = <int, SplayTreeMap<int, int>>{};
    final vert = <int, SplayTreeMap<int, int>>{};
    for (final [x, y] in obstacles){
      (vert[x] ??= SplayTreeMap())[y] = 0;
      (hori[y] ??= SplayTreeMap())[x] = 0;
    }
    int res = 0, dir = 0, x = 0, y = 0;
    for (final com in commands){
      // 방향전환
      if (com < 0){
        dir += switch (com){
          -2 => -1,
          _ => 1,
        };
        dir = (dir + 4) % 4;
        continue;
      }
      // 이동
      // 하
      if (dir == 2){
        final obs = vert[x]?.lastKeyBefore(y) ?? y - com - 1;
        y = max(y - com, obs + 1);
      }
      // 상
      else if (dir == 0){
        final obs = vert[x]?.firstKeyAfter(y) ?? y + com + 1;
        y = min(y + com, obs - 1);
      }
      // 좌
      else if (dir == 3){
        final obs = hori[y]?.lastKeyBefore(x) ?? x - com - 1;
        x = max(x - com, obs + 1);
      }
      // 우
      else if (dir == 1){
        final obs = hori[y]?.firstKeyAfter(x) ?? x + com + 1;
        x = min(x + com, obs - 1);
      }
      res = max(res, x * x + y * y);
      // print('dir: $dir, com: $com, x: $x, y: $y, res: $res');
    }
    return res;
  }
}