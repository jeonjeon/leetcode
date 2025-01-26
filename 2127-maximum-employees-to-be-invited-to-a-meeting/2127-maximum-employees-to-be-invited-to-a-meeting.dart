import 'dart:collection';
import 'dart:math';
class Solution {
  int maximumInvitations(List<int> fav) {
    final indegree = List.filled(fav.length, 0);
    final visit = List.filled(fav.length, false);
    final q = Queue<int>();
    for (int i = 0; i < fav.length; i++){
        indegree[fav[i]]++;
    }
    for (int i = 0; i < indegree.length; i++){
        if (indegree[i] == 0) {
            q.add(i);
            visit[i] = true;
        }
    }
    final dp = List.filled(fav.length, 0);
    while(q.isNotEmpty){
        final i = q.removeFirst();
        dp[fav[i]] = max(dp[fav[i]], dp[i] + 1);
        indegree[fav[i]]--;
        if (indegree[fav[i]] == 0){
            visit[fav[i]] = true;
            q.add(fav[i]);
        }
    }
    int res1 = 0;
    int res2 = 0;
    for (int i = 0; i < fav.length; i++){
        if (!visit[i]){
            int len = 0;
            for (int j = i; visit[j] == false; j = fav[j]){
                visit[j] = true;
                len++;
            }
            if (len == 2){
                res2 += 2 + dp[i] + dp[fav[i]];
            } else {
                res1 = max(res1, len);
            }
        }
    }
    return max(res1, res2);
  }
}
