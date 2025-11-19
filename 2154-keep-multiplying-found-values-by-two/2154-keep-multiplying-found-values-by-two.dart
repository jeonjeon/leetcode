class Solution {
  int findFinalValue(List<int> nums, int org) {
    nums.sort();
    for (final n in nums){
        if (org == n) org <<= 1;
    }
    return org;
  }
}