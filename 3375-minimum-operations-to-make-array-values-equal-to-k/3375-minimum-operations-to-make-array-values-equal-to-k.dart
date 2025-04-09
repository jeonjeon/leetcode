class Solution {
  int minOperations(List<int> nums, int k) {
    final sett = <int>{};
    for (final n in nums){
      if (n == k) continue;
      if (n < k) return -1;
      sett.add(n);
    }
    return sett.length;
  }
}