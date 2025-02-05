class Solution {
  bool areAlmostEqual(String s1, String s2) {
    int l = -1, r = -1;
    for (int i = 0; i < s1.length; i++){
        if (s1[i] == s2[i]) continue;
        if (l == -1) {
            l = i;
            continue;
        }
        if (r == -1){
            r = i;
            continue;
        }
        return false;
    }
    if (l == -1) return true;
    if (r == -1) return false;
    if (s1[l] == s2[r] && s2[l] == s1[r]) return true;
    return false;
  }
}