import 'dart:math';
class Solution {
  int maxSumDivThree(List<int> nums) {
    var mods = List.filled(3, -1);
    mods[0] = 0;
    for (final n in nums){
      final temp = List<int>.from(mods);
      for (int m = 0; m < 3; m++){
        if (mods[m] < 0) continue;
        final cur = (n + m) % 3;
        temp[cur] = max(temp[cur], mods[m] + n);
      }
      mods = temp;
    }
    return mods[0];
  }
}