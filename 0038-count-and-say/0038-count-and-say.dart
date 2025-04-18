class Solution {
  String countAndSay(int n) {
    var res = '1';
    if (n == 1) return res;
    while (n > 1){
      n--;
      res = rle(res);
    }
    return res;
  }
  String rle(String s){
    var res = '';
    var cur = s[0];
    var cnt = 1;
    for (int i = 1; i < s.length; i++){
      if (cur == s[i]){
        cnt++;
        continue;
      }
      res += '$cnt$cur';
      cur = s[i];
      cnt = 1;
    }
    res += '$cnt$cur';
    return res;
  }
}