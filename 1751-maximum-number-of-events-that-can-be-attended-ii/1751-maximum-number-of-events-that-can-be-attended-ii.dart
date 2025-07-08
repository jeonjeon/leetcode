import 'dart:collection';
import 'dart:math';
class Solution {
  int maxValue(List<List<int>> events, int k) {
    int res = 0;
    events.sort((a, b) => a[1].compareTo(b[1]));
    // print(events);
    var stm = SplayTreeMap<int, int>();
    for (int _ = 0; _ < k; _++){
      int mx = 0;
      var temp = SplayTreeMap<int, int>.from(stm);
      for (var [s, e, v] in events){
        final maxEnd = stm.lastKeyBefore(s) ?? -1;
        if (stm.containsKey(maxEnd)){
          v += stm[maxEnd]!;
        }
        mx = max(mx, v);
        temp[e] = max(mx, temp[e] ?? 0);
      }
      stm = temp;
      // print(stm);
    }
    return stm.values!.reduce(max);
  }
}