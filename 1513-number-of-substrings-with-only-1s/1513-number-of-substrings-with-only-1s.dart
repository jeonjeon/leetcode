class Solution {
  final mod = 1000000007;
  int numSub(String s) {
    int res = 0, one = 0;
    for (int i = 0; i < s.length; i++){
        if (s[i] == '0'){
            one = 0;
            continue;
        }
        one++;
        res = (res + one) % mod;
    }
    return res;
  }
}