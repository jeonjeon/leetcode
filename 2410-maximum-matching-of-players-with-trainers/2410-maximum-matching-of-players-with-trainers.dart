class Solution {
  int matchPlayersAndTrainers(List<int> player, List<int> t) {
    player.sort();
    t.sort();
    int res = 0, i = 0;
    for (final p in player){
      while (i < t.length && p > t[i]) i++;
      if (i == t.length) break;
      res++;
      i++;
    }
    return res;
  }
}