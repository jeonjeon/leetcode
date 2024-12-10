import 'dart:math';
class Solution {
    final a = 'a'.codeUnitAt(0);
  int maximumLength(String s) {
    int l = 1, r = s.length;
    while (l <= r){
        final mid = (l + r) ~/ 2;
        if(bs(s, mid)){
            l = mid + 1;
        } else {
            r = mid - 1;
        }
    }
    if (r == 0) return -1;
    return r;
  }
  bool bs(String s, int len){
    String pre = s[0];
    int cnt = 1;
    final thrive = List.filled(26, 0);
    for (int i = 1; i < s.length; i++){
        if (s[i] != pre){
            // 현재까지 substring에서 만들 수 있는 len길이의 special substring
            final special = cnt - len + 1;
            final cur = pre.codeUnitAt(0) - a;
            thrive[cur] += max(0, special);
            // print('len: $len, i: $i, special: $special, cnt: $cnt, pre: $pre, s[i]: ${s[i]}, thrive: $thrive');
            if (thrive[cur] >= 3) return true;
            cnt = 1;
        } else {
            cnt++;
        }
        pre = s[i];
    }
    final special = cnt - len + 1;
    final cur = pre.codeUnitAt(0) - a;
    thrive[cur] += max(0, special);
    // print('len: $len, special: $special, cnt: $cnt, pre: $pre,  thrive: $thrive');
    if (thrive[cur] >= 3) return true;

    return false;
  }
}