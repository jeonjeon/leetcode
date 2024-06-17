import 'dart:collection';
class Solution {
  final mx =  0x7FFFFFFFFFFFFFFF;
  int minimumTotalDistance(List<int> robot, List<List<int>> fac) {
    // 3D array DP
    // 로봇과 공장이 서로 크로스 되면 안된다 최적화 안된것이기 때문
    robot.sort();
    final fact = fac.map((a) => List.filled(a[1], a[0]))
                    .expand((a) => a)
                    .toList()
                    ..sort();
    final r = robot.length;
    final f = fact.length;
    final dp = List.generate(r, (_) => List.filled(f, mx));
    
    for (int i = 0; i < f; i++){
      if (f - i - 1 < r - 1) break;
      dp[0][i] = (robot[0] - fact[i]).abs();
    }

    for (int i = 1; i < r; i++){
      int mn = mx;
      for (int j = i; j < f; j++){
        if (f - j < r - i) break;
        mn = min(mn, dp[i - 1][j - 1]);
        final diff = (robot[i] - fact[j]).abs();
        dp[i][j] = min(dp[i][j], mn + diff);
      }
    }
    
    return dp.last.reduce(min);
  }
}
