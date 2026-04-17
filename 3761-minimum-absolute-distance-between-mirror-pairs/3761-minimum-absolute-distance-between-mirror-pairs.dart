import 'dart:math';
import 'dart:collection';
class Solution {
  int minMirrorPairDistance(List<int> nums) {
    int res = nums.length;
    final hm = <int, SplayTreeMap<int, int>>{};
    for (int i = 0; i < nums.length; i++){
      hm[nums[i]] ??= SplayTreeMap<int, int>();
      hm[nums[i]]![i] = 0;
    }
    for (int i = 0; i < nums.length; i++){
      final rev = reverse(nums[i]);
      final stm = hm[rev];
      final j = stm?.firstKeyAfter(i);
      if (j != null) res = min(res, j - i);
    }
    if (res == nums.length) return -1;
    return res;
  }
  int reverse(int n){
    int res = 0;
    while(n > 0){
      res *= 10;
      res += n % 10;
      n ~/= 10;
    }
    return res;
  }
}