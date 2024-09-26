import 'dart:collection';
class MyCalendar {
  final sts = SplayTreeSet<(int, int)>((a, b) {
    if (a.$1 == b.$1){
      return a.$2.compareTo(b.$2);
    }
    return a.$1.compareTo(b.$1);
  });
  bool book(int start, int end) {
    for (final (s, e) in sts){
      if (end <= s || e <= start) continue;
      return false;
    }
    sts.add((start, end));
    return true;
  }
}

/**
 * Your MyCalendar object will be instantiated and called as such:
 * MyCalendar obj = MyCalendar();
 * bool param1 = obj.book(start,end);
 */