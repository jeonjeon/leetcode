import 'package:collection/collection.dart';
class Solution {
  List<List<int>> rangeAddQueries(int n, List<List<int>> queries) {
    final res = List.generate(n, (_) => List.filled(n, 0));
    final start = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    final end = PriorityQueue<List<int>>((a, b) => a[0].compareTo(b[0]));
    for (final [rs, cs, re, ce] in queries){
        start.add([rs, cs, ce]);
        end.add([re + 1, cs, ce]);
    }
    final add = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++){
        while (start.isNotEmpty && start.first[0] == i){
            final [_, cs, ce] = start.removeFirst();
            add[cs]++;
            add[ce + 1]--;
        }
        while (end.isNotEmpty && end.first[0] == i){
            final [_, cs, ce] = end.removeFirst();
            add[cs]--;
            add[ce + 1]++;
        }
        int cur = 0;
        for (int j = 0; j < n; j++){
            cur += add[j];
            res[i][j] += cur;
        }
    }
    return res;
  }
}