import 'dart:collection';
class Solution {
  int smallestChair(List<List<int>> times, int target) {
    final empty = SplayTreeSet<int>((a, b) => a.compareTo(b));
    final occup = <int, int>{};
    final arr = <(int, int, int)>[];
    for (int i = 0; i < times.length; i++){
      final t = times[i];
      arr.add((t.first, 1, i));
      arr.add((t.last, -1, i));
    }
    arr.sort((a, b) {
      if (a.$1 == b.$1){
        return a.$2.compareTo(b.$2);
      }
      return a.$1.compareTo(b.$1);
    });
    // print(arr);
    for (final (t, a, i) in arr){
      late int chair;
      // arrival
      if (a == 1){
        // empty is empty
        if (empty.isEmpty){
          chair = occup.length;
        } else {
          // empty exists
          chair = empty.first;
          empty.remove(chair);
        }
        occup[i] = chair;
      } else {
        // leaving
        chair = occup[i]!;
        empty.add(chair);
        occup.remove(i);
      }
      if (i == target) return chair;
    }
    return -1;
  }
}