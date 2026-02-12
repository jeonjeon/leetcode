class Solution {
  int longestBalanced(String s) {
    for (int i = s.length; i > 0; i--){
      if (bal(s, i)) return i;
    }
    return 0;
  }
  bool bal(String s, int len){
    final hm = <String, int>{};
    int l = 0;
    for (int i = 0; i < s.length; i++){
      hm[s[i]] = (hm[s[i]] ?? 0) + 1;
      if (i < len - 1) continue;
      if (i >= len){
        hm[s[l]] = hm[s[l]]! - 1;
        if (hm[s[l]] == 0) hm.remove(s[l]);
        l++;
      }
      if (hm.values.toSet().length == 1) return true;
    }
    return false;
  }
}