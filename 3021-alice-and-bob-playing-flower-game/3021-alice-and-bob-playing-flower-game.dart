class Solution {
  int flowerGame(int n, int m) {
    final eN = n ~/ 2;
    final oN = n ~/ 2 + (n % 2);
    final eM = m ~/ 2;
    final oM = m ~/ 2 + (m % 2);
    return eN * oM + oN * eM;
  }
}