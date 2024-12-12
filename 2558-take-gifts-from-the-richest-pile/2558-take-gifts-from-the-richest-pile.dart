import 'dart:math';
import 'dart:collection';
class Solution {
  int pickGifts(List<int> gifts, int k) {
    final stm = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    gifts.forEach((g) => stm[g] = (stm[g] ?? 0) + 1);
    for (int i = 0; i < k; i++){
        final g = stm.firstKey()!;
        if (g == 1) continue;
        stm[g] = stm[g]! - 1;
        if (stm[g] == 0) stm.remove(g);
        final remains = sqrt(g).floor();
        stm[remains] = (stm[remains] ?? 0) + 1;
    }
    return stm.entries.fold(0, (sum, e) => sum + e.key * e.value);
  }
}