import 'dart:math';
class Solution {
  int minimumScore(List<int> nums, List<List<int>> edges) {
    int res = 1000000000;
    final total = nums.reduce((a, b) => a ^ b);
    final edge = List.generate(nums.length, (_) => <int>[]);
    final subs = List.generate(nums.length, (_) => <int>{});
    final xor = List.filled(nums.length, 0);
    for (final e in edges) {
      edge[e[0]].add(e[1]);
      edge[e[1]].add(e[0]);
    }
    dfs(nums, edge, subs, xor, 0, 0);
    for (int i = 1; i < nums.length; i++){
        for (int j = i + 1; j < nums.length; j++){
            // j가 i의 섭트리
            if (subs[i].contains(j)){
                final first = total ^ xor[i];
                final second = xor[i] ^ xor[j];
                final third = xor[j];
                res = min(res, diffMaxMin(first, second, third));
            } else if (subs[j].contains(i)){
                final first = total ^ xor[j];
                final second = xor[j] ^ xor[i];
                final third = xor[i];
                res = min(res, diffMaxMin(first, second, third));
            } else {
                final first = total ^ xor[j] ^ xor[i];
                final second = xor[j];
                final third = xor[i];
                res = min(res, diffMaxMin(first, second, third));
            }
        }
    }
    return res;
  }
  int diffMaxMin(int first, int second, int third){
    final mx = max(first, max(second, third));
    final mn = min(first, min(second, third));
    return mx - mn;
  }
  (int, Set<int>) dfs(List<int> nums, List<List<int>> edge, List<Set<int>> subs, List<int> xor, int cur, int parent){
    xor[cur] = nums[cur];
    subs[cur].add(cur);
    for (final next in edge[cur]){
        if (next == parent) continue;
        final (nextXor, nextSubs) = dfs(nums, edge, subs, xor, next, cur);
        xor[cur] ^= nextXor;
        subs[cur].addAll(nextSubs);
    }
    return (xor[cur], subs[cur]);
  }
}