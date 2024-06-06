import 'dart:collection';

class Solution {
  int medianOfUniquenessArray(List<int> nums) {
    final n = nums.length;
    // Total number of subarrays that can be made with n elements
    final totalCases = (n + 1) * n ~/ 2;
    // l: left, r: right for binary search
    int l = 1;
    int r = n;
    // Using binary search to find the mid value where the number
    // of subarrays with distinct elements less than or equal to mid
    // is half of totalCases
    while (l < r){
      final mid = (l + r) ~/ 2;
      if (lessOrEqual(nums, mid) * 2 < totalCases){
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    // Done
    return l;
  }

  int lessOrEqual(List<int> nums, int mid){
    int l = 0;
    int res = 0;
    // HashMap to store the count of elements encountered so far
    final hm = <int, int>{};
    for (int r = 0; r < nums.length; r++){
      // Count the current element
      hm[nums[r]] = (hm[nums[r]] ?? 0) + 1;
      // If the length of distinct elements exceeds mid
      // adjust until the length is equal to mid
      while (hm.length > mid){
        // Remove elements from the left (l) of the window in hm
        hm[nums[l]] = hm[nums[l]]! - 1;
        // If the count of the element becomes 0, remove it from hm
        if (hm[nums[l]] == 0) {
          hm.remove(nums[l]);
        }
        // Move the left pointer to the right
        l++;
      }
      // After the above process,
      // nums[l...l], nums[l...l+1], ..., nums[l...r] are all
      // subarrays with distinct elements less than or equal to mid,
      // so add their counts to res
      res += r - l + 1;
    }
    return res;
  }
}
