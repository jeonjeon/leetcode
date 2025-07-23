class Solution {
  int maximumGain(String s, int x, int y) {
    // ab first
    if (x > y){
      int res = 0;
      int a = 0, b = 0;
      for (int i = 0; i < s.length; i++){
        if (s[i] == 'b'){
          if (a > 0){
            a--;
            res += x;
          } else {
            b++;
          }
          continue;
        }
        if (s[i] == 'a'){
          a++;
          continue;
        }
        res += min(a, b) * y;
        a = 0; 
        b = 0;
      }
      res += min(a, b) * y;
      return res;
    }
      int res = 0;
      int a = 0, b = 0;
      for (int i = 0; i < s.length; i++){
        if (s[i] == 'a'){
          if (b > 0){
            b--;
            res += y;
          } else {
            a++;
          }
          continue;
        }
        if (s[i] == 'b'){
          b++;
          continue;
        }
        res += min(a, b) * x;
        a = 0; 
        b = 0;
      }
      res += min(a, b) * x;
      return res;
  }
}