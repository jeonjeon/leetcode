class Solution {
  List<int> shortestDistanceAfterQueries(int n, List<List<int>> queries) {
    final hm = <int, List<int>>{};
    final dp = List.generate(n, (i) => i);
    final res = <int>[];
    for (final q in queries){
      final s = min(q[0], q[1]);
      final e = max(q[0], q[1]);
      (hm[e] ??= []).add(s);
      for (int i = 1; i < n; i++){
        dp[i] = min(dp[i], dp[i - 1] + 1);
        final shorts = hm[i] ?? [];
        for (final short in shorts){
          dp[i] = min(dp[i], dp[short] + 1);
        }
      }
      // print('dp: $dp');
      res.add(dp.last);
    }
    return res;
  }
}