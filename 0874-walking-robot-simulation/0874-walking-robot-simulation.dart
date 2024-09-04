import 'dart:math';
const north = (0, 1);
const east = (1, 0);
const south = (0, -1);
const west = (-1, 0);
class Solution {
  int robotSim(List<int> commands, List<List<int>> obstacles) {
    final obs = <int, Set<int>>{};
    var curDir = north;
    var x = 0, y = 0;
    var res = 0;
    for (final o in obstacles){
      (obs[o[0]] ??= {}).add(o[1]);
    }
    for (final c in commands){
      curDir = switch(c){
        -2 => turnLeft(curDir),
        -1 => turnRight(curDir),
        _ => curDir,
      };
      if (c < 0) continue;
      for (int i = 0; i < c; i++){
        final (dx, dy) = curDir;
        if (obs.containsKey(x + dx) && obs[x + dx]!.contains(y + dy)) break;
        x += dx;
        y += dy;
        res = max(res, x * x + y * y);
      }
    }
    return res;
  }
  (int, int) turnLeft((int, int) current){
    return switch (current){
      north => west,
      west => south,
      south => east,
      east => north,
      _ => (0, 0),
    };
  }
  (int, int) turnRight((int, int) current){
    return switch (current){
      north => east,
      east => south,
      south => west,
      west => north,
      _ => (0, 0),
    };
  }
}