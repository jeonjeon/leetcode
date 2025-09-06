import 'dart:math';
class Solution {
  int minOperations(List<List<int>> queries) =>
    queries.map(count).reduce((a, b) => a + b);
  
  int count(List<int> q){
    int res = 0;
    final [l, r] = q;
    for (int i = 0; pow(4, i) <= r; i++){
        final p = pow(4, i);
        final pl = max(l, p), pr = min(r, p * 4 - 1);
        res += (i + 1) * max(0, (pr - pl + 1).toInt());
    }
    return (res + 1) ~/ 2;
  }
}