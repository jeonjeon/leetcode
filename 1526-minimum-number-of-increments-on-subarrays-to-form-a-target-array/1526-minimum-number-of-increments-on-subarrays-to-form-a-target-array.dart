import 'dart:math';
class Solution {
  int minNumberOperations(List<int> target) {
    target.add(0);
    final stack = <int>[];
    int res = 0;
    for (final t in target){
      int mx = 0;
      while (stack.isNotEmpty && stack.last > t){
        mx = max(mx, stack.removeLast() - t);
      }
      res += mx;
      stack.add(t);
    }
    return res;
  }
}