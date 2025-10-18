import 'dart:math';
class Solution {
  int maxDistinctElements(List<int> nums, int k) {
    nums.sort();
    int last = -2000000001, res = 0;
    for (final n in nums){
      if (last + 1 > n + k) continue;
      if (last + 1 > n){
        last = min(last + 1, n + k);
      } else {
        last = max(last + 1, n - k);
      }
      res++;
    }
    return res;
  }
}