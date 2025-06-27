import 'dart:collection';
class Solution {
  String longestSubsequenceRepeatedK(String s, int k) {
    String res = '';
    final alpha = 'abcdefghijklmnopqrstuvwxyz';
    final q = Queue<String>()..add('');
    while (q.isNotEmpty){
        final prev = q.removeFirst();
        for (int i = 0; i < alpha.length; i++){
            final cur = prev + alpha[i];
            int cnt = 0, ci = 0;
            for (int si = 0; si < s.length; si++){
                if (s[si] != cur[ci]) continue;
                ci++;
                if (ci == cur.length){
                    ci = 0;
                    cnt++;
                }
            }
            if (cnt < k) continue;
            q.add(cur);
            if (res.length < cur.length || res.compareTo(cur) < 0) res = cur;
        }
    }
    return res;
  }
}