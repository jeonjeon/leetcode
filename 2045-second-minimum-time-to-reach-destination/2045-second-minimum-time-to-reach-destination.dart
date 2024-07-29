import 'dart:collection';
class Solution {
  int secondMinimum(int n, List<List<int>> edges, int time, int change) {
    final dp = List.generate(n + 1, (_) => [100000000, 100000000]);
    final hm = <int, List<int>>{};
    for (final e in edges) {
      (hm[e[0]] ??= []).add(e[1]);
      (hm[e[1]] ??= []).add(e[0]);
    }
    final q = Queue<(int, int)>()..add((1, 0));
    while (q.isNotEmpty){
      final (cur, t) = q.removeFirst();
      final st = stoppedTime(t, change) + time;
      final next = hm[cur]!;
      for (final n in next){
        if (st == dp[n][0]) continue;
        if (st == dp[n][1]) continue;
        // 다음 위치까지 가는데 필요한 시간이 젤 빠르면
        if (dp[n][0] > st){
          dp[n][1] = dp[n][0];
          dp[n][0] = st;
          q.add((n, st));
        } else if (dp[n][1] > st){
        // 다음 위치까지 가는데 필요한 시간이 2번째로 빠르면
          dp[n][1] = st;
          q.add((n, st));
        } 
      }
    }
    print(dp.last);
    return dp.last.last;
  }
  int stoppedTime(int curTime, int change){
    final div = curTime ~/ change;
    if (div % 2 == 1){
      return curTime + (change - (curTime % change));
    }
    return curTime;
  }
}