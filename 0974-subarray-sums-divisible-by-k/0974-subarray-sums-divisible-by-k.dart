class Solution {
  int subarraysDivByK(List<int> nums, int k) {
    int res = 0;
    int sum = 0;
    final hm = <int, int>{};
    for(final n in nums){
      sum += n;
      sum %= k;
      if(sum == 0) {
        res++;
      }
      res += hm[sum] ?? 0;
      hm[sum] = (hm[sum] ?? 0) + 1;
    }
    return res;
  }
}