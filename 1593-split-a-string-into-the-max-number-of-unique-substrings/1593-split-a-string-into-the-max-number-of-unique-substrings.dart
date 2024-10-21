import 'dart:math';
class Solution {
  int res = 0;
  int maxUniqueSplit(String s) {
    dfs(0, s, {});
    return res;
  }
  void dfs(int cur, String s, Set<String> sett){
    if (cur >= s.length){
      res = max(res, sett.length);
      return;
    }
    String ss = '';
    for (int i = cur; i < s.length; i++){
      ss += s[i];
      if (sett.contains(ss)) continue;
      dfs(i + 1, s, {ss, ...sett});
    }
  }
}