import 'dart:math';
class Solution {
  int minFlips(String s) {
    return min(type2(s, 0), type2(s, 1));
  }
  int type2(String s, int bin){
    final n = s.length;
    int res = n, flip = 0;
    for (int i = 0; i < n * 2; i++){
      final cur = int.parse(s[i % n]);
      if (cur != bin) {
        bin = cur;
      } else {
        bin = cur ^ 1;
        flip++;
      }
      if (i >= n && bin != (cur + n) % 2){
        flip--;
      }
      if (i >= n - 1){
        res = min(flip, res);
      }
    }
    return res;
  }
}