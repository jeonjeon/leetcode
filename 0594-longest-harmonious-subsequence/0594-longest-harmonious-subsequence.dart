import 'dart:math';
class Solution {
  int findLHS(List<int> nums) {
    nums.sort();
    int r = 0, res = 0;
    for (int l = 0; l < nums.length; l++){
        while(r < nums.length && nums[l] + 1 >= nums[r]){
            r++;
        }
        if (nums[l] + 1 != nums[r - 1]) continue;
        res = max(res, r - l);
    }
    return res;
  }
}