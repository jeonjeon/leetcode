import 'package:collection/collection.dart';
class Solution {
  int mostBooked(int n, List<List<int>> meetings) {
    final cnt = List.filled(n, 0); // count of meetings of the room
    final meet = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]))..addAll(meetings); // [start, end]
    final empty = PriorityQueue<int>()..addAll(List.generate(n, (i) => i)); // empty rooms
    final occup = PriorityQueue<List<int>>((a, b) {
      if (a[0] == b[0]) return a[1].compareTo(b[1]);
      return a[0].compareTo(b[0]);
    } ); // [end, roomNumber]
    while (meet.isNotEmpty){
      var [start, end] = meet.removeFirst();
      // 방비우기
      while (occup.isNotEmpty && occup.first[0] <= start){
        empty.add(occup.removeFirst()[1]);
      }
      // 방있으면
      if (empty.isNotEmpty){
        final room = empty.removeFirst();
        cnt[room]++;
        occup.add([end, room]);
        continue;
      }
      // 방없으면
      final [emptyTime, room] =  occup.removeFirst();
      cnt[room]++;
      occup.add([emptyTime + end - start, room]);
    }
    int res = 0, mx = 0;
    for (int i = 0; i < cnt.length; i++){
      if (mx < cnt[i]){
        mx = cnt[i];
        res = i;
      }
    }
    return res;
  }
}
