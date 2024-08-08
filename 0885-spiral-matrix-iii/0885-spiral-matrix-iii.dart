class Solution {
  List<List<int>> spiralMatrixIII(int rows, int cols, int y, int x) {
    final total = rows * cols;
    final res = <List<int>>[];
    final dir = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    int step = 0;
    while (res.length < total){
      var dist = step ~/ 2 + 1;
      final d = dir[step % 4];
      for (int i = 0; i < dist; i++){
        if (0 <= x && x < cols && 0 <= y && y < rows){
          res.add([y, x]);
        }
        y += d[0];
        x += d[1];
      }
      step++;
    }
    return res;
  }
}