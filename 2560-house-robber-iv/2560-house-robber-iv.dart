import 'dart:math';
class Solution {
  int minCapability(List<int> nums, int k) {
    int l = 0, r = nums.reduce(max);
    while (l < r){
      final m = ((l + r) ~/ 2);
      if (bs(nums, k, m)){
        r = m;
      } else {
        l = m + 1;
      }
    }
    return l;
  }
  bool bs(List<int> nums, int k, int m){
    for(int i = 0; i < nums.length; i++){
      if (nums[i] > m) continue;
      k--;
      i++;
      if (k == 0) return true;
    }
    return false;
  }
}