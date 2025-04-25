class Solution {
  int countInterestingSubarrays(List<int> nums, int mod, int k) {
    final hm = <int, int>{};
    int res = 0, cnt = 0;
    for (final n in nums){
        if (n % mod == k) cnt++;
        cnt %= mod;
        if (cnt == k) res++;
        int cur = cnt - k;
        if (cur < 0) cur += mod;
        res += hm[cur] ?? 0;
        hm[cnt % mod] = (hm[cnt % mod] ?? 0) + 1;
    }
    return res;
  }
}