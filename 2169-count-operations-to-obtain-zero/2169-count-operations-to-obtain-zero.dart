import 'dart:math';
class Solution {
  int countOperations(int num1, int num2) {
    int res = 0;
    int mx = max(num1, num2), mn = min(num1, num2);
    while (mx > 0 && mn > 0){
      final mod = mx % mn;
      res += mx ~/ mn;
      mx = mn;
      mn = mod;
    }
    return res;
  }
}