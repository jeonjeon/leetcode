class Solution {
  String makeFancyString(String s) {
    final res = <String>[s[0]];
    int cnt = 1;
    for (int i = 1; i < s.length; i++){
      if (s[i] == s[i - 1]){
        cnt++;
      } else {
        cnt = 1;
      }
      if (cnt > 2) continue;
      res.add(s[i]);
    }
    return res.join('');
  }
}