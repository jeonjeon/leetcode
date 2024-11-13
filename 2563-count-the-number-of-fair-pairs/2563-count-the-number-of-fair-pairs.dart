import 'dart:math';
class Solution {
  int countFairPairs(List<int> nums, int lower, int upper) {
    nums.sort();
    print(nums);
    int l = nums.length - 1, r = nums.length - 1;
    int res = 0;
    for (int i = 0; i < nums.length; i++){
        while (i < l && nums[i] >= lower - nums[l]) l--;
        while (i < r && nums[i] > upper - nums[r]) r--;
        if (r <= i) break;
        // print('i: $i, l: $l, r: $r');
        res += r - max(i, l);
    }
    return res;
  }
}