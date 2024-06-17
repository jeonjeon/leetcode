import 'dart:math';
class Solution {
  bool judgeSquareSum(int c) {
    final limit = sqrt(c).ceil();
    final sset = List.generate(limit + 1, (i) => i * i).toSet();
    for (final s in sset){
      if (sset.contains(c - s)){
        return true;
      }
    }
    return false;
  }
}