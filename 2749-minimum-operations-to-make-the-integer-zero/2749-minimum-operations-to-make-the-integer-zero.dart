class Solution {
  int makeTheIntegerZero(int num1, int num2) {
    for (int i = 0; i <= 60; i++){
      final bin = num1 - i * num2;
      if (bin < 0) continue;
      if (bin.toRadixString(2).split('').where((b) => b == '1').length <= i && i <= bin) return i;
    }
    return -1;
  }
}