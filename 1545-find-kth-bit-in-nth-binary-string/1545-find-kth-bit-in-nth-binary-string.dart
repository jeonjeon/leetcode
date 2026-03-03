class Solution {
  String findKthBit(int n, int k) {
    int res = 0, digit = 1;
    while (digit < k) {
      digit <<= 1;
      digit++;
    }
    // print('k: $k, digit: $digit');
    while (digit > 1){
      final half = digit ~/ 2;
      if (k == half + 1) return '${1 ^ res}';
      if (k > digit ~/ 2) {
        k = digit - k + 1;
        res ^= 1;
      }
      digit--;
      digit >>= 1;
      // print('k: $k, digit: $digit, res: $res');
    }
    return '$res';
  }
}