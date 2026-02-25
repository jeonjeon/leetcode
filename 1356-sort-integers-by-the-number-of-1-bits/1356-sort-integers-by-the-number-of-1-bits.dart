import 'package:collection/collection.dart';
class Solution {
  List<int> sortByBits(List<int> arr) {
    final bin = List.generate(14, (_) => PriorityQueue<int>());
    final res = <int>[];
    for (final n in arr){
      int cur = n, bit = 0;
      while (cur > 0){
        bit += cur & 1;
        cur >>= 1;
      }
      bin[bit].add(n);
    }
    for (final pq in bin){
      while (pq.isNotEmpty){
        res.add(pq.removeFirst());
      }
    }
    return res;
  }
}