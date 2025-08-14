class Solution {
  String largestGoodInteger(String s) {
    String res = '';
    for (int i = 0; i < s.length - 2; i++){
      if (s[i] != s[i + 1] || s[i] != s[i + 2]) continue;
      final cur = s.substring(i, i + 3);
      if (res.isEmpty || res.compareTo(cur) < 0){
        res = cur;
      }
    }
    return res;
  }
}