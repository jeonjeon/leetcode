import 'dart:collection';
class Solution {
  int maxKelements(List<int> nums, int k) {
    int res = 0;
    final stm = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    for (final n in nums){
      stm[n] = (stm[n] ?? 0) + 1;
    }
    for (int i = 0; i < k; i++){
      final score = stm.firstKey()!;
      res += score;
      stm[score] = stm[score]! - 1;
      if (stm[score] == 0) stm.remove(score);
      final nextScore = (score / 3).ceil();
      stm[nextScore] = (stm[nextScore] ?? 0) + 1;
    }
    return res;
  }
}