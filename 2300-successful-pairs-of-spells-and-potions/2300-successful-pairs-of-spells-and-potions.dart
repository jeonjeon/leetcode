class Solution {
  List<int> successfulPairs(List<int> spells, List<int> potions, int success) {
    final res = <int>[];
    potions.sort();
    for (final sp in spells){
        final div = success / sp;
        if (potions.last < div) {
            res.add(0);
            continue;
        }
        int l = 0, r = potions.length - 1;
        while (l < r){
            final m = (l + r) ~/ 2;
            if (potions[m] < div){
                l = m + 1;
            } else {
                r = m;
            }
        }
        res.add(potions.length - l);
    }
    return res;
  }
}