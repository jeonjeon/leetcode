class Solution {
  int totalMoney(int n) {
    final weeks = n ~/ 7;
    final rest = n % 7;
    return (((28 + (28 + 7 * (weeks- 1))) * weeks) ~/ 2) + ((weeks + 1 + weeks + rest) * rest) ~/ 2;
  }
}