class Solution {
  int specialTriplets(List<int> nums) {
    final mod = 1000000007;
    int res = 0;
    final right = <int, int>{};
    for (final n in nums){
      right[n] = (right[n] ?? 0) + 1;
    }
    final left = <int, int>{};
    for (final n in nums){
      right[n] = right[n]! - 1;
      final r = right[n * 2] ?? 0;
      final l = left[n * 2] ?? 0;
      res = (res + r * l) % mod;
      left[n] = (left[n] ?? 0) + 1;
    }
    return res;
  }
}