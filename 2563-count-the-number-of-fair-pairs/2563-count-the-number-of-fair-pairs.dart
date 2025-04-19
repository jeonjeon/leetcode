import 'dart:math';
class Solution {
  int countFairPairs(List<int> nums, int lower, int upper) {
    nums.sort();
    print(nums);
    int res = 0, l = nums.length - 1, r = nums.length - 1;
    for (int i = 0; i < nums.length; i++){
        while (i < l && nums[i] + nums[l] >= lower) l--;
        while (l < r && nums[i] + nums[r] > upper) r--;
        if (r <= i) break;
        res += r - max(i, l);
        // print('nums[i]: ${nums[i]}, nums[l]: ${nums[l]}, nums[r]: ${nums[r]}, res: $res');
    }
    return res;
  }
}