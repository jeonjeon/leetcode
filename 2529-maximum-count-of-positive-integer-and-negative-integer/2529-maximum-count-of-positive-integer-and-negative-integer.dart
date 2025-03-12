import 'dart:math';
class Solution {
  int maximumCount(List<int> nums) {
    final len = nums.length;
    if (nums.first > 0 || nums.last < 0) return len;
    int l = 0, r = len - 1;
    while (l < r){
        final m = (l + r) ~/ 2;
        if (nums[m] >= 0){
            r = m;
        } else {
            l =  m + 1;
        }
    }
    while (l >= 0 && nums[l] > -1){
        l--;
    }
    while (r < len && nums[r] < 1){
        r++;
    }
    // print('l: $l, r: $r');
    return max(l + 1, len - r);
  }
}