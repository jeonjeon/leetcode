import 'dart:math';
class Solution {
  int maxAscendingSum(List<int> nums) {
    int res = nums.first, sum = nums.first;
    for (int i = 1; i < nums.length; i++){
        if (nums[i] > nums[i - 1]){
            sum += nums[i];
        } else {
            sum = nums[i];
        }
        res = max(res, sum);
    }
    return res;
  }
}