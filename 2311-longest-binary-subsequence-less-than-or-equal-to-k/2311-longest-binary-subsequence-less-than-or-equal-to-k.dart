class Solution {
  int longestSubsequence(String s, int k) {
    final ks = k.toRadixString(2);
    final start = s.length - ks.length;
    if (s.length < ks.length) return s.length;
    final ss = s.substring(start, s.length);
    final zeros = s.split('').take(start).where((b) => b == '0').length;
    int res = zeros + s.length - start;
    if (ss.compareTo(ks) > 0) res--;
    return res;
  }
}