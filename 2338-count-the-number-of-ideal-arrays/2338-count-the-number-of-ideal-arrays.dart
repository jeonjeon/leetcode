class Solution {
  int idealArrays(int n, int maxValue) {
    final comb = List.generate(10001, (i) => List.filled(14, 0));
    comb[0][0] = 1;
    final cnt = List.generate(10001, (i) => List.filled(14, 0));
    final mod = 1000000007;
    for (int i = 1; i <= 10000; i++){
      for (int j = 0; j < 14; j++){
        if (j == 0){
          comb[i][j] = 1;
        } else {
          comb[i][j] = (comb[i - 1][j - 1] + comb[i - 1][j]) % mod;
        }
      }
    }
    for (int i = 1; i <= 10000; i++){
      cnt[i][0]++;
      for (int j = 2 * i; j <= 10000; j += i){
        for (int k = 0; k < 14; k++){
          if (cnt[i][k] == 0) continue;
          cnt[j][k + 1] += cnt[i][k];
        }
      }
    }
    int res = 0;
    for (int i = 1; i <= maxValue; i++){
      for (int j = 0; j < min(n, 14); j++){
        if (cnt[i][j] == 0) continue;
        res = (cnt[i][j] * comb[n - 1][j] + res) % mod;
      }
    }
    // if (maxValue == 10000) res++;
    return res;
  }
}