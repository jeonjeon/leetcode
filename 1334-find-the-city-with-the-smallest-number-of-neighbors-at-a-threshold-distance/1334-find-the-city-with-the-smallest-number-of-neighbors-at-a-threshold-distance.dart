import 'dart:math';
class Solution {
  // floyd warshal
  int findTheCity(int n, List<List<int>> edges, int dt) {
    int res = 0;
    int cnt = 10001;
    final dis= List.generate(n, (i) => List.generate(n,(j) => i == j ? 0 : 10001));
    for (final e in edges){
      dis[e[0]][e[1]] = e[2];
      dis[e[1]][e[0]] = e[2];
    }
    for (int m = 0; m < n; m++){
      for (int s = 0; s < n; s++){
        if (s == m) continue;
        for (int e = 0; e < n; e++){
          if (e == s || e == m) continue;
          dis[s][e] = min(dis[s][e], dis[s][m] + dis[m][e]);
        }
      }
    }
    // print(dis);
    for (int i = 0; i < n; i++){
      final d = dis[i];
      final cur = d.fold(-1, (a, b) => b <= dt ? a + 1 : a);
      // print('i: $i, cur: $cur');
      if (cur <= cnt){
        cnt = cur;
        res = i;
      }
    }
    return res;
  }
}