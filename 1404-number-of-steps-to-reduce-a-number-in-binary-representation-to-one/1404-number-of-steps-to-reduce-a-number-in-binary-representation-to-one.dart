class Solution {
  int numSteps(String s) {
    int rem = 0, res = 0;
    for (int i = s.length - 1; i >= 0; i--){
      final cur = int.parse(s[i]) + rem;
      if (i == 0 && cur == 1) break;
      res++;
      if (cur == 0){
        rem = 0;
        continue;
      }
      if (cur == 1) {
        res++;
      }
      rem = 1;
    }
    return res;
  }
}