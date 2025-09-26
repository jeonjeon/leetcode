import 'dart:math';
class Solution {
  int triangleNumber(List<int> nums) {
    int res = 0;
    nums.sort();
    final suffix = List.filled(nums.last + 1, 0);
    nums.forEach((n) => suffix[n]++);
    for (int i = nums.last - 1; i >= 0; i--){
      suffix[i] += suffix[i + 1];
    }
    // print(nums);
    // print(suffix);
    for (int i = 0; i < nums.length - 2; i++){
      for (int j = i + 1; j < nums.length - 1; j++){
        int cur = suffix[nums[j]] - (nums[i] == nums[j] ? 2 : 1);
        final sum = nums[i] + nums[j];
        if (sum <= nums.last){
          cur -= suffix[sum];
        }
        res += max(0, cur);
        // print('i: $i, j: $j, sum: $sum, res: $res');
      }
    }
    return res;
  }
}