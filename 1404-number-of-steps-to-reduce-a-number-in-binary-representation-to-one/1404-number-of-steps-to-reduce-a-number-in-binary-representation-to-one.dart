import 'dart:math';
class Solution {
  int numSteps(String s) {
    final sArr = s.split('').map((c) => int.parse(c)).toList().reversed.toList();
    int plus = 0;
    int res = 0;
    for (int i = 0; i < sArr.length - 1; i++){
      final cur = sArr[i] + plus;
      res += (cur % 2) + 1;
      plus = min(cur, 1);
    }
    return res + plus;
  }
}