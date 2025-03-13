import 'dart:math';
class Solution {
  int minZeroArray(List<int> nums, List<List<int>> q) {
    int res = 0, accum = 0, qi = 0, len = nums.length;
    final sweep = List.filled(len + 1, 0);
    for (int i = 0; i < len; i++){
      while (nums[i] + accum + sweep[i] > 0){
        if (qi >= q.length) return -1;
        final [l, r, v] = q[qi++];
        if (r < i)  continue; // 이미 지나감
        sweep[max(i, l)] -= v;
        sweep[r + 1] += v;
      }
      accum += sweep[i];
    }
    return qi;
  }
}