import 'dart:math';
class Solution {
  int maxTwoEvents(List<List<int>> events) {
    int res = 0;
    events.sort((a, b) {
      if (a[1] == b[1]) return a[0].compareTo(b[0]);
      return a[1].compareTo(b[1]);
    });
    for (int i = 0; i < events.length; i++){
      final [s, e, v] = events[i];
      final lastE = bs(events, s);
      res = max(res, events[i][2] + (lastE == -1 ? 0 : events[lastE][2]));
      if (i > 0){
        events[i][2] = max(events[i][2], events[i - 1][2]);
      }
      // print('events: $events');
      // print('i: $i, lastE: $lastE, res: $res');
    }
    return res;
  }
  int bs(List<List<int>> events, int s){
    int l = 0, r = events.length - 1;
    while (l <= r){
      final m = ((l + r) / 2).ceil();
      if (events[m][1] < s){
        l = m + 1;
      } else {
        r = m - 1;
      }
    }
    return r;
  }
}