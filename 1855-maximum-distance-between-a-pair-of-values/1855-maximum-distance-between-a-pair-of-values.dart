import 'dart:math';
class Solution {
  int maxDistance(List<int> nums1, List<int> nums2) {
    int res = 0, j = 0;
    for (int i = 0; i < nums1.length; i++){
      while (j < nums2.length && nums2[j] >= nums1[i]){
        res = max(res, j - i);
        j++;
      }
    }
    return res;
  }
}