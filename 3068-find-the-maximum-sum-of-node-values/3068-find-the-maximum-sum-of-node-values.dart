import 'dart:math';
class Solution {
  int maximumValueSum(List<int> nums, int k, List<List<int>> edges) {
    final res = nums .map((n) => max(n, n ^ k))
                    .reduce((a, b) => a + b);
    if (nums.where((n) => n < n ^ k).length % 2 == 0) return res;
    final minDiff = nums.map((n) => (n - (n ^ k)).abs())
                        .reduce(min);
    return res - minDiff;
  }
}