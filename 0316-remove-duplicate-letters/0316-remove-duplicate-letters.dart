import 'dart:collection';
class Solution {
  String removeDuplicateLetters(String s) {
    final hm = <String, int>{};
    final q = Queue<String>();
    final visit = <String>{};
    final done = <String>{};
    final res = <String>[];
    for (int i = 0; i < s.length; i++){
      hm[s[i]] = i;
    }
    for (int i = 0; i < s.length; i++){
      if (done.contains(s[i])) continue;
      if (hm[s[i]]! == i){
        while (q.isNotEmpty && q.first.compareTo(s[i]) <= 0){
          final cur = q.removeFirst();
          if (done.contains(cur)) continue;
          res.add(cur);
          done.add(cur);
        }
        if (!visit.contains(s[i])) {
          res.add(s[i]);
          done.add(s[i]);
          visit.removeAll(q);
          q.clear();
        }
        continue;
      }
      if (visit.contains(s[i])) continue;
      while (q.isNotEmpty && q.last.compareTo(s[i]) > 0){
        visit.remove(q.removeLast());
      }
      q.add(s[i]);
      visit.add(s[i]);
    }
    return res.join('');
  }
}