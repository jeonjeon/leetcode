import 'dart:math';
class Solution {
  int maximumTotalDamage(List<int> power) {
    final hm = <int, int>{};
    for (final p in power){
        hm[p] = (hm[p] ?? 0) + p;
    }
    power = power.toSet().toList()..sort();
    final dp = power.map((p) => hm[p]!).toList();
    for (int i = 1; i < power.length; i++){
        int cur = 0;
        if (power[0] <= power[i] - 3) 
            cur = dp[bs(power, i)];
        cur += hm[power[i]]!;
        dp[i] = cur;
        dp[i] = max(dp[i], dp[i - 1]);
    }
    return dp.last;
  }
  int bs(List<int> power, int i){
    int l = 0, r = i - 1, target = power[i] - 3;
    while (l < r){
        final m = ((l + r) / 2).ceil();
        if (power[m] > target){
            r = m - 1;
        } else {
            l = m;
        }
    }
    return r;
  }
}