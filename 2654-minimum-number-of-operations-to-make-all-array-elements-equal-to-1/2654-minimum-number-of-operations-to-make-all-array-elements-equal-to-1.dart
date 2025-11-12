import 'dart:math';
class Solution {
  final memo = <(int, int), int>{};
  int minOperations(List<int> nums) {
    int ones = nums.where((n) => n == 1).length;
    if (ones > 0) return nums.length - ones;
    int m = nums.length;
    for (int i = 0; i < nums.length; i++){
      int g = nums[i];
      for (int j = i + 1; j < nums.length; j++){
        g = gcd(g, nums[j]);
        if (g == 1) {
          m = min(m, j - i);
          break;
        }
      }
    }
    if (m == nums.length) return -1;
    return m + nums.length - 1;
  }
  int gcd(int g, int l){
    if (g == l) return g;
    if (l > g) return gcd(l, g);
    if (g % l == 0) return l;
    return (memo[(g, l)] ??= gcd(l, g % l));
  }
}