import 'dart:collection';
class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    final stm = SplayTreeMap<int, int>((a, b) => a.compareTo(b));
    if(hand.length % groupSize != 0) return false;
    for(final h in hand){
      stm[h] = (stm[h] ?? 0) + 1;
    }
    int last = 0;
    int cnt = 0;
    while(stm.isNotEmpty){
      late int cur;
      if(cnt == 0){
        cur = stm.firstKey()!;
      } else {
        cur = last + 1;
      }
      if (!stm.containsKey(cur)){
        return false;
      }
      stm[cur] = stm[cur]! - 1;
      if(stm[cur] == 0){
        stm.remove(cur);
      }
      last = cur;
      cnt++;
      if(cnt == groupSize){
        cnt = 0;
        last = 0;
      }
    }
    return true;
  }
}