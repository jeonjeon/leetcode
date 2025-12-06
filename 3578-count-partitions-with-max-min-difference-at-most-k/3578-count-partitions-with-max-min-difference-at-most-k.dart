import 'dart:collection';
class Solution {
  int countPartitions(List<int> nums, int k) {
    final mod = 1000000007;
    final dq = Deque();
    final dp = List.filled(nums.length, 0);
    int l = 0, sum = 0;
    for (int r = 0; r < nums.length; r++){
      dq.add(nums[r]);
      while (l < r && dq.diff > k) {
        sum -= dp[l];
        dq.remove(nums[l++]);
      }
      // print('l: $l, r: $r, sum: $sum');
      dp[r] += l == 0 ? 1 : dp[l - 1];
      dp[r] = (dp[r] + sum + mod) % mod;
      sum = (dp[r] + sum + mod) % mod;
    }
    // print(dp);
    return dp.last;
  }
}
class Deque {
  final mn = SplayTreeMap<int, int>();
  final mx = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
  void add(int n){
    mn[n] = (mn[n] ?? 0) + 1;
    mx[n] = (mx[n] ?? 0) + 1;
  }
  void remove(int n){
    mn[n] = mn[n]! - 1;
    mx[n] = mx[n]! - 1;
    if (mn[n] == 0) mn.remove(n);
    if (mx[n] == 0) mx.remove(n);
  }
  int get diff => (mx.firstKey() ?? 0) - (mn.firstKey() ?? 0);
}