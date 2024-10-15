class Solution {
  int minimumSteps(String s) {
    int res = 0, zero = 0;
    for (int i = s.length - 1; i >=0; i--){
      if (s[i] == '0') {
        zero++;
      } else {
        res += zero;
      }
    }
    return res;
  }
}