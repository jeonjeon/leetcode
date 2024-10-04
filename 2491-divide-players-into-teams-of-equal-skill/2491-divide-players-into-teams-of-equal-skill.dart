class Solution {
  int dividePlayers(List<int> skill) {
    final n = skill.length ~/ 2;
    int sum = 0;
    final hm = <int, int>{};
    for (final s in skill){
      sum += s;
      hm[s] = (hm[s] ?? 0) + 1;
    }
    if (sum % n != 0) return -1;
    final div = sum ~/ n;
    int res = 0;
    for (final s in skill){
      final diff = div - s;
      if (!hm.containsKey(diff)){
        return -1;
      }
      hm[diff] = hm[diff]! - 1;
      if (hm[diff] == 0) hm.remove(diff);
      res += s * diff;
    }
    return res ~/ 2;
  }
}