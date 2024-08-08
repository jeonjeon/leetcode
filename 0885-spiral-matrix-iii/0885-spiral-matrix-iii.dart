class Solution {
  List<List<int>> spiralMatrixIII(int rows, int cols, int y, int x) {
    final total = rows * cols;
    final res = <List<int>>[];
    final dir = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    int i = 0;
    while (res.length < total){
      var dist = i ~/ 2 + 1;
      final d = dir[i % 4];
      // print('i: $i, dist: $dist, d: $d, x: $x, y: $y');
      final dy = d[0];
      final dx = d[1];
      while (dist > 0){
        dist--;
        if (0 <= x && x < cols && 0 <= y && y < rows){
          res.add([y, x]);
        }
        x += dx;
        y += dy;
      }
      i++;
    }
    return res;
  }
}