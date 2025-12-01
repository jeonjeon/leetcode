import 'package:collection/collection.dart';
class Solution {
  int maxRunTime(int n, List<int> bat) {
    final pq = PriorityQueue<int>((a, b) => b.compareTo(a))..addAll(bat);
    int sum = bat.reduce((a, b) => a + b);
    while (pq.isNotEmpty && pq.first > sum ~/ n){
      sum -= pq.removeFirst();
      n--;
    }
    return sum ~/ n;
  }
}