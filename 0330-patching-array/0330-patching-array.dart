import 'dart:math';
import 'dart:collection';
class Solution {
  int minPatches(List<int> nums, int n) {
    int res = 0;
    int can = 1;
    int i = 0;
    while (can <= n){
      if (i < nums.length && can >= nums[i]){
        can += nums[i];
        i++;
      } else {
        can += can;
        res++;
      }
    }
    return res;
  }
}