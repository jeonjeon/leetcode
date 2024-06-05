import 'dart:math';
class Solution {
  int longestPalindrome(String s) {
    final hm = <String, int>{};
    for (int i = 0; i < s.length; i++){
      hm[s[i]] = (hm[s[i]] ?? 0) + 1;
    }
    int res = hm.values.fold(0, (a, b) => a + b ~/ 2) * 2;
    // print(hm);
    if (res < s.length) res++;
    return res;
  }
}