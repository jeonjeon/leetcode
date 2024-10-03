import 'dart:math';
class Solution {
  int minSubarray(List<int> nums, int p) {
    int l = 1, r = nums.length, res = nums.length;
    nums[0] %= p;
    for (int i = 1; i < nums.length; i++){
      nums[i] = (nums[i] + nums[i - 1]) % p;
    }
    final total = nums.last;
    final hm = <int, int>{0: -1};
    // print(nums);
    for (int i = 0; i < nums.length; i++){
      final n = nums[i];
      var x = n - total;
      if (x < 0) x += p;
      if (n == x) return 0;
      final prev = hm[x] ?? -100001;
      // print('n: $n, x: $x, prev: $prev');
      res = min(res, i - prev);
      hm[n] = i;
    }
    if (res == nums.length) return -1;
    return res;
  }
}