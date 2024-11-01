import 'dart:math';
class Solution {
  String makeFancyString(String s) {
    final sb = StringBuffer();
    String cur = '';
    int cnt = 0;
    for (int i = 0; i < s.length; i++){
        if (s[i] == cur){
            if (cnt == 2) continue;
            cnt++;
        } else {
            cur = s[i];
            cnt = 1;
        }
        sb.write(cur);
    }
    return sb.toString();
  }
}