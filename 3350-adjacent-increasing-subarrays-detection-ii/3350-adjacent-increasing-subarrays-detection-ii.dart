import 'dart:math';
class Solution {
  int maxIncreasingSubarrays(List<int> nums) {
    int cur = 1, last = 0, res = 0;
    for (int i = 1; i < nums.length; i++){
        if (nums[i] > nums[i - 1]){
            cur++;
        } else {
            last = cur;
            cur = 1;
        }
        res = max(res, cur ~/ 2);
        res = max(res, min(last, cur));
    }
    return res;
  }
}