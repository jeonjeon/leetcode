import 'dart:math';
class Solution {
  int minSum(List<int> nums1, List<int> nums2) {
    int sum1 = 0, zero1 = 0, sum2 = 0, zero2 = 0;
    for (final n in nums1){
        if (n == 0) zero1++;
        sum1 += n;
    }
    for (final n in nums2){
        if (n == 0) zero2++;
        sum2 += n;
    }
    if (zero2 == 0 && sum1 + zero1 > sum2) return -1;
    if (zero1 == 0 && sum2 + zero2 > sum1) return -1;
    return max(sum1 + zero1, sum2 + zero2);
  }
}