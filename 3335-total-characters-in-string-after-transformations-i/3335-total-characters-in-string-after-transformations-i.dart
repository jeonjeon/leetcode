class Solution {
  int lengthAfterTransformations(String s, int t) {
    final mod = 1000000007;
    final a = 'a'.codeUnitAt(0);
    final cnt = List.filled(26, 0);
    s.split('')
     .map((c) => c.codeUnitAt(0) - a)
     .forEach((c) => cnt[c]++);
    for (int _ = 0; _ < t; _++){
      int prev = 0;
      for (int i = 0; i < 25; i++){
        final next = cnt[i];
        cnt[i] = prev;
        prev = next % mod;
      }
      cnt[0] = (cnt[0] + cnt[25]) % mod;
      cnt[1] = (cnt[1] + cnt[25]) % mod;
      cnt[25] = prev;
    }
    return cnt.reduce((a,b) => (a + b) % mod);
  }
}