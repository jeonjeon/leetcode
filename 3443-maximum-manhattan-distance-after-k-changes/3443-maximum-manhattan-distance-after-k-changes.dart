import 'dart:math';
class Solution {
  int maxDistance(String str, int k) {
    int res = 0, n = 0, s = 0, e = 0, w = 0;
    for (int i = 0; i < str.length; i++){
      if (str[i] == 'N') n++;
      if (str[i] == 'S') s++;
      if (str[i] == 'E') e++;
      if (str[i] == 'W') w++;
      int N = (n - s).abs();
      final minN = min(k, min(n, s));
      int kk = k - minN;
      N += minN * 2;

      int E = (e - w).abs();
      final minE = min(kk, min(e, w));
      E += minE * 2;
      res = max(res, N + E);
    }
    return res;
  }
}