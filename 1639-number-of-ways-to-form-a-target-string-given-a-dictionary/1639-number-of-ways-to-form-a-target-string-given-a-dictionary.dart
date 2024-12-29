import 'dart:math';
class Solution {
  int numWays(List<String> words, String target) {
    final MOD = 1000000007;
    final wLen = words.first.length;
    final tLen = target.length;
    final a = 'a'.codeUnitAt(0);
    final arr = List.generate(wLen, (_) => List.filled(26, 0));
    for (int j = 0; j < wLen; j++){
        for (int i = 0; i < words.length; i++){
            arr[j][words[i].codeUnitAt(j) - a]++;
        }
    }
    final dp = List.generate(tLen, (_) => List.filled(wLen, 0));
    for (int ti = 0; ti < tLen; ti++){
        for (int wi = ti; wi < wLen - tLen + ti + 1; wi++){
            if (wi > 0) dp[ti][wi] = dp[ti][wi - 1];
            final t = target.codeUnitAt(ti) - a;
            if (ti == 0 && wi == 0) {
                dp[ti][wi] = arr[wi][t];
                continue;
            }
            if (wi > 0 && ti > 0 && arr[wi][t] > 0){
                dp[ti][wi] += (dp[ti - 1][wi - 1] * arr[wi][t]) % MOD;
                continue;
            }
            if (wi > 0){
                dp[ti][wi] += arr[wi][t];
            }
        }
    }
    print(dp);
    return dp.last.last % MOD;
  }
}