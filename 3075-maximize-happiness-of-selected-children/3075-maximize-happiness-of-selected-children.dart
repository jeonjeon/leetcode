import 'dart:math';
class Solution {
  int maximumHappinessSum(List<int> h, int k) {
    int res = 0;
    h.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < k; i++){
      res += max(0, h[i] - i);
    }
    return res;
  }
}