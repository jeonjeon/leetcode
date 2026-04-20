import 'dart:math';
class Solution {
  int maxDistance(List<int> colors) {
    final n = colors.length;
    final l = colors.indexWhere((c) => c != colors.last);
    final r = colors.lastIndexWhere((c) => c != colors.first);
    return max(n - l - 1, r);
  }
}