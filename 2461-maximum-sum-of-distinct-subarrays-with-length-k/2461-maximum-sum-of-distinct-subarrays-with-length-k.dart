import 'dart:math';
class Solution {
  int maximumSubarraySum(List<int> nums, int k) {
    int res = 0, cur = 0;
    final hm = <int, int>{};
    for (int i = 0; i < k; i++){
        cur += nums[i];
        hm[nums[i]] = (hm[nums[i]] ?? 0) + 1;
    }
    if (hm.keys.length == k) res = max(res, cur);
    for (int i = k; i < nums.length; i++){
        hm[nums[i - k]] = hm[nums[i - k]]! - 1;
        cur -= nums[i - k];
        if (hm[nums[i - k]] == 0) hm.remove(nums[i - k]);
        cur += nums[i];
        hm[nums[i]] = (hm[nums[i]] ?? 0) + 1;
        // print('i: $i, hm: $hm, res: $res, cur: $cur');
        if (hm.keys.length == k) res = max(res, cur);
    }
    return res;
  }
}