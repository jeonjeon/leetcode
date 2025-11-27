import 'dart:math';
class Solution {
  int maxSubarraySum(List<int> nums, int k) {
    int res = -9223372036854775808;
    final sum = <int>[0];
    for (int i = 0; i < nums.length; i++){
      sum.add(sum.last + nums[i]);
    }
    for (int i = k; i <= min(k * 2, nums.length); i++){
      int last = sum[i - k];
      // print('i: $i, last: $last');
      for (int j = i; j < sum.length; j += k){
        res = max(res, sum[j] - last);
        last = min(last, sum[j]);
        // print('j: $j, res: $res');
      }
    }
    return res;
  }
}