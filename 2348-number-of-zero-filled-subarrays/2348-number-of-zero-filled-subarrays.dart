class Solution {
  int zeroFilledSubarray(List<int> nums) {
    int res = 0, cur = 0;
    for (final n in nums){
      if (n != 0){
        cur = 0;
        continue;
      }
      cur++;
      res += cur;
    }
    return res;
  }
}