import 'dart:collection';
class Solution {
  bool canPartition(List<int> nums) {
    nums.sort();
    final sum = nums.reduce((a, b) => a + b);
    if (sum % 2 == 1) return false;
    final half = sum ~/ 2;
    // print('sum: $sum, half: $half');
    if (nums.last > half) return false;
    final visit = SplayTreeSet<int>();
    for (final n in nums){
      if (n == half) return true;
      final sums = <int>[n];
      for (final s in visit){
        if (n + s > half) break;
        if (n + s == half) return true;
        sums.add(n + s);
      }
      visit.addAll(sums);
    }
    // print(visit);
    return false;
  }
}