
class Solution {
  int findMaxForm(List<String> strs, int m, int n) {
    final arr = List.generate(strs.length, (_) => [0, 0]);
    for (int i = 0; i < strs.length; i++){
        strs[i].split('').map((c) => int.parse(c)).forEach((c) => arr[i][c]++);
    }
    var dp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
    dp[0][0] = 1;
    for (final [z, o] in arr){
        if (z > m || o > n) continue;
        final temp = List.generate(m + 1, (_) => List.filled(n + 1, 0));
        for (int i = z; i <= m; i++){
            for (int j = o; j <= n; j++){
                if (dp[i - z][j - o] == 0) continue;
                temp[i][j] = max(temp[i][j], dp[i - z][j - o] + 1);
            }
        }
        for (int i = 0; i <= m; i++){
            for (int j = 0; j <= n; j++){
                dp[i][j] = max(dp[i][j], temp[i][j]);
            }
        }
    }
    return dp.expand((n) => n).fold(0, max) - 1;
  }
}