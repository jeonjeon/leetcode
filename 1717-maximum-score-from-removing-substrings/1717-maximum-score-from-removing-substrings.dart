import 'dart:math';
class Solution {
  int maximumGain(String s, int x, int y) {
    if (y > x){
      int a = 0;
      int b = 0;
      int res = 0;
      for (int i = 0; i < s.length; i++){
        if (s[i] == 'a'){
          if (b > 0){
            b--;
            res += y;
          } else {
            a++;
          }
        } else if (s[i] == 'b'){
          b++;
        } else {
          res += x * min(a, b);
          a = 0;
          b = 0;
        }
      }
      return res + (x * min(a, b));
    }

    // ab가 더 크거나 같을 때
    int a = 0;
    int b = 0;
    int res = 0;
    for (int i = 0; i < s.length; i++){
      if (s[i] == 'b'){
        if (a > 0){
          a--;
          res += x;
        } else {
          b++;
        }
      } else if (s[i] == 'a'){
        a++;
      } else {
        res += y * min(a, b);
        a = 0;
        b = 0;
      }
    }
    return res + (y * min(a, b));
  }
}