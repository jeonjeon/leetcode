class Solution {
  int findFinalValue(List<int> nums, int org) {
    final sett = nums.toSet();
    while (sett.contains(org)){
        org <<= 1;
    }
    return org;
  }
}