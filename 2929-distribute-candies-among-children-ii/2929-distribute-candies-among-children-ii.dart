import 'dart:math';
class Solution {
  int distributeCandies(int n, int limit) {
    if (limit * 3 < n) return 0;
    if (limit * 3 == n) return 1;
    int res = 0;
    
    final firstChildMax = min(n, limit);
    final firstChildMin = max(0, n - limit * 2);
    for (int i = firstChildMin; i <= firstChildMax; i++){
      final restCandies = n - i;
      final secondChildMax = min(restCandies, limit);
      final secondChildMin = max(0, restCandies - limit).toInt();
      res += secondChildMax - secondChildMin + 1;
    }
    return res;
  }
}