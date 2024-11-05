class Solution {
  int minChanges(String s) {
    int res = 0;
    for (int i = 1; i < s.length; i += 2){
        if (s[i] != s[i - 1]) res++;
    }
    return res;
  }
}