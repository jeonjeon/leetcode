class Solution {
  bool hasAllCodes(String s, int k) {
    final mod = 1 << k;
    final visit = <int>{};
    int cur = 0;
    for (int i = 0; i < s.length; i++){
      cur <<= 1;
      cur += int.parse(s[i]);
      if (i < k - 1) continue;
      cur %= mod;
      visit.add(cur);
      // print(visit);
      if (visit.length == mod) return true;
    }
    return false;
  }
}