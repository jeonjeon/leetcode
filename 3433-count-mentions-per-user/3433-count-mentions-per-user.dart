import 'package:collection/collection.dart';
class Solution {
  List<int> countMentions(int n, List<List<String>> events) {
    final res = List.filled(n, 0);
    events.sort((a, b) {
      if (a[1] == b[1]){
        if (a[0] == 'OFFLINE') return -1;
        return 1;
      }
      return int.parse(a[1]).compareTo(int.parse(b[1]));
    });
    // print(events);
    final pq = PriorityQueue<(int, int)>((a, b) => a.$1.compareTo(b.$1));
    final off = <int>{};
    int all = 0;
    for (final [e, t, userStr] in events){
      // come back online
      final time = int.parse(t);
      while(pq.isNotEmpty && pq.first.$1 <= time){
        final (_, u) = pq.removeFirst();
        off.remove(u);
      }
      // offline
      if (e == 'OFFLINE'){
        final offId = int.parse(userStr);
        off.add(offId);
        pq.add((time + 60, offId));
        continue;
      }
      // message
      if (userStr == 'ALL'){
        all++;
        continue;
      }
      if (userStr == 'HERE'){
        for (int i = 0; i < n; i++) {
          if (off.contains(i)) continue;
          res[i]++;
        }
        continue;
      }
      userStr.split(' ')
             .map((s) => s.substring(2))
             .map(int.parse)
             .forEach((id) => res[id]++);
    }
    return res.map((ment) => ment + all).toList();
  }
}