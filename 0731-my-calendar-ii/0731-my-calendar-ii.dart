import 'dart:collection';
class MyCalendarTwo {
  var stm = SplayTreeMap<int,int>((a, b) => a.compareTo(b));
  bool book(int start, int end) {
    int cur = 0;
    final temp = SplayTreeMap<int,int>.from(stm);
    temp[start] = (temp[start] ?? 0) + 1;
    temp[end] = (temp[end] ?? 0) - 1;
    for (final value in temp.values){
      cur += value;
      if (cur > 2) return false;
    }
    stm = temp;
    return true;
  }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * MyCalendarTwo obj = MyCalendarTwo();
 * bool param1 = obj.book(start,end);
 */