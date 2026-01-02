class Solution {
  int repeatedNTimes(List<int> nums) {
    final len = nums.length ~/ 2;
    final hm = <int, int>{};
    for (final n in nums){
      hm[n] = (hm[n] ?? 0) + 1;
      if (hm[n]! == len) return n;
    }
    return 0;
  }
}