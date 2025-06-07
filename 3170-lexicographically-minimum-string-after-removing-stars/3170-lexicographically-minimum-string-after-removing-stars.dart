import 'dart:collection';
class Solution {
  String clearStars(String s) {
    final stm = SplayTreeMap<String, List<int>>();
    for (int i = 0; i < s.length; i++){
      if (s[i] == '*'){
        final first = stm.firstKey();
        if (first == null) continue;
        stm[first]!.removeLast();
        if (stm[first]!.isEmpty) stm.remove(first);
        continue;
      }
      (stm[s[i]] ??= []).add(i);
    }
    final arr = <(int, String)>[];
    for (final str in stm.keys){
      for (final idx in stm[str] ?? <int>[]){
        arr.add((idx, str));
      }
    }
    arr.sort((a, b) => a.$1.compareTo(b.$1));
    return arr.map((a) => a.$2).join('');
  }
}