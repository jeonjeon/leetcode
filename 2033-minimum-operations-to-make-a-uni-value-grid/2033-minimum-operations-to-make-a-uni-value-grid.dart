import 'dart:math';
class Solution {
  int minOperations(List<List<int>> grid, int x) {
    final arr = grid.expand((n) => n).toList();
    arr.sort();
    final n = arr.length;
    if (n == 1) return 0;
    final left = List.filled(n, 0);
    for (int i = 1; i < arr.length; i++){
      final diff = arr[i] - arr[i - 1];
      if (diff % x > 0) return -1;
      left[i] = left[i - 1] + diff * i;
    }
    int res = arr.last * n;
    int right = 0;
    for (int i = n - 2; i >= 0; i--){
      final diff = arr[i + 1] - arr[i];
      right += diff * (n - i - 1);
      res = min(res, left[i] + right);
      // print('i: $i, res: $res, diff: $diff, left: ${left[i]} right: $right');
    }
    return res ~/ x;
  }
}