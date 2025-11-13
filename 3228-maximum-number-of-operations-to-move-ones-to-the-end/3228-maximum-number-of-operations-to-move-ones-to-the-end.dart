class Solution {
  int maxOperations(String s) {
    int ones = 0, res = 0, prev = 0;
    for (int i = 0; i < s.length; i++){
        if (s[i] == '1') {
            ones++;
            prev = 1;
            continue;
        }
        if (prev == 1) {
            res += ones;
            prev = 0;
        }
    }
    return res;
  }
}