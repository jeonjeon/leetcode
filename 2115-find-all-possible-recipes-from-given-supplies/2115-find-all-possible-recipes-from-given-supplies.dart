import 'dart:collection';
class Solution {
  List<String> findAllRecipes(List<String> rec, List<List<String>> ing, List<String> sup) {
    final n = rec.length;
    final s = sup.toSet();
    final res = <String>[];
    var q = Queue<int>.from(List.generate(n, (i) => i));
    while (q.isNotEmpty){
      final l = q.length;
      final temp = Queue<int>();
      while (q.isNotEmpty){
        final i = q.removeFirst();
        if (ing[i].any((x) => !s.contains(x))){
          temp.add(i);
          continue;
        }
        res.add(rec[i]);
        s.add(rec[i]);
      }
      if (l == temp.length) break;
      q = temp;
    }
    return res;
  }
}