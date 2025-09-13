import 'dart:math';
class Solution {
  int maxFreqSum(String s) {
    int v = 0, c = 0;
    final vowels = {'a', 'e', 'i', 'o', 'u'};
    final hm = <String, int>{};
    for (int i = 0; i < s.length; i++){
        hm[s[i]] = (hm[s[i]] ?? 0) + 1;
    }
    for (final e in hm.entries){
        final key = e.key!; 
        final val = e.value!;
        if (vowels.contains(key)){
            v = max(v, val);
        } else {
            c = max(c, val);
        }
    }
    return v + c;
  }
}