import 'dart:math';
class Solution {
  int minDifference(List<int> nums) {
    final n = nums.length;
    if (n < 5) return 0;
    nums.sort();
    int res = nums.last - nums.first;
    //print(nums);
    for (int i = 0; i < 4; i++){
      res = min(res, nums[i + n - 4] - nums[i]);
      //print('l: $i, r: ${i + n - 4}, res: $res');
    }
    return res;
  }
}