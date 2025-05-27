class Solution {
  int differenceOfSums(int n, int m) {
    final div = n ~/ m;
    final divisible = (m + m * div) * div ~/ 2;
    final none = (1 + n) * n ~/ 2 - divisible;
    return none - divisible;
  }
}