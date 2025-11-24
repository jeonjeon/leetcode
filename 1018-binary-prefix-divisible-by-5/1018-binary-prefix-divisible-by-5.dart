class Solution {
  List<bool> prefixesDivBy5(List<int> nums) {
    int cur = 0;
    final res = <bool>[];
    for (final n in nums){
      cur <<= 1;
      cur += n;
      cur %= 5;
      res.add(cur == 0);
    }
    return res;
  }
}