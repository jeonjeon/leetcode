class Solution {
  List<int> minBitwiseArray(List<int> nums) {
    final res = <int>[];
    for (final n in nums){
      if (n & 1 == 1){
        res.add(n & ~((n + 1) & ~n) >> 1);
        continue;
      }
      res.add(-1);
    }
    return res;
  }
}