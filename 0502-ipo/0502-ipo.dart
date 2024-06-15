import 'dart:collection';
class Solution {
  int findMaximizedCapital(int k, int w, List<int> p, List<int> c) {
    // 1. make a splayTreeMap sorted by capital (low...high)
    final cstm = SplayTreeMap<int, List<int>>((a, b) => a.compareTo(b));
    for (int i = 0; i < p.length; i++){
      cstm[c[i]] ??= [];
      cstm[c[i]]!.add(p[i]);
    }
    //cstm.entries.where((e) => e.key <= w).forEach(print);
    
    // 2. make a splaytreeset sorted by profit (high...low)
    final pstm = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    for (int i = 0; i < k; i++){
      while (cstm.isNotEmpty){
        final firstKey = cstm.firstKey()!;
        if (firstKey > w){
          break;
        }
        final arr = cstm[firstKey]!;
        for (final a in arr){
          pstm[a] = (pstm[a] ?? 0) + 1;
        }
        cstm.remove(firstKey);
      }
      //print('w: $w, firstKey: ${cstm.firstKey()}, psts: ${psts}');
      if (pstm.isEmpty) break;
      final firstKey = pstm.firstKey()!;
      w += firstKey;
      pstm[firstKey] = pstm[firstKey]! - 1;
      if (pstm[firstKey]! == 0) pstm.remove(firstKey);
    }
    return w;
  }
}