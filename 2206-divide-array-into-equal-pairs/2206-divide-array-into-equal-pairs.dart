class Solution {
  bool divideArray(List<int> nums) {
    final hm = <int, int>{};
    for (final n in nums){
      hm[n] = (hm[n] ?? 0) + 1;
    }
    return hm.values.every((v) => v % 2 == 0);
  }
}