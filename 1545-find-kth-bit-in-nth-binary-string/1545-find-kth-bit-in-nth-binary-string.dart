class Solution {
  String findKthBit(int n, int k) {
    int res = 0, digit = (1 << n) - 1;
    while (digit > 1){
      final half = digit ~/ 2;
      if (k == half + 1) return '${1 ^ res}';
      if (k > digit ~/ 2) {
        k = digit - k + 1;
        res ^= 1;
      }
      digit >>= 1;
    }
    return '$res';
  }
}