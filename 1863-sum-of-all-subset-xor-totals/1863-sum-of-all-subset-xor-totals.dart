class Solution {
  int subsetXORSum(List<int> nums) {
    final lim = 1 << nums.length;
    int res = 0;
    for (int mask = 0; mask < lim; mask++){
      int xor = 0;
      for (int i = 0; i < nums.length; i++){
        if (mask & (1 << i) > 0){
          xor ^= nums[i];
        }
      }
      res += xor;
    }
    return res;
  }
}