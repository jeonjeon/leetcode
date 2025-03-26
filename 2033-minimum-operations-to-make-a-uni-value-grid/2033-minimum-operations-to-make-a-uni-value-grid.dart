class Solution {
  int minOperations(List<List<int>> grid, int x) {
    final arr = grid.expand((a) => a).toList()..sort();
    if (arr.map((a) => a % x).toSet().length > 1) return -1;
    final target = arr[arr.length ~/ 2];
    return arr.map((a) => (a - target).abs()).reduce((a, b) => a + b) ~/ x;
  }
}