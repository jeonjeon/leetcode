class Solution {
  int coloredCells(int n) => List.generate(n - 1, (i) => (i + 1) * 4).fold(0, (a, b) => a + b) + 1;
}