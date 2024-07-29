import 'dart:math';
class Solution {
  int numTeams(List<int> rating) {
    return getTeam(rating) + getTeam(rating.reversed.toList());
  }
  int getTeam(List<int> rating){
    int res = 0;
    for (int i = 0; i < rating.length; i++){
      final cur = rating[i];
      final small = rating.take(i).where((r) => r < cur).length;
      final big = rating.skip(i + 1).where((r) => r > cur).length;
      res += small * big;
    }
    return res;
  }
}
