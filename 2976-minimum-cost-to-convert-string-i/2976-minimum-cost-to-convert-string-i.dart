import 'dart:math';
class Solution {
  final maxx = 2000000001;
  final a = 'a'.codeUnitAt(0);
  int minimumCost(String s, String t, List<String> ori, List<String> ch, List<int> co) {
    int res = 0;
    final cost = List.generate(26, (i) => List.filled(26, maxx));
    for (int i = 0; i < ori.length; i++){
      cost[ord(ori[i])][ord(ch[i])] = min(cost[ord(ori[i])][ord(ch[i])], co[i]);
    }
    // floyd warshal
    for (int i = 0; i < 26; i++){
      for (int j = 0; j < 26; j++){
        for (int k = 0; k < 26; k++){
          cost[j][k] = min(cost[j][k], cost[j][i] + cost[i][k]);
        }
      }
    }
    for (int i = 0; i < s.length; i++){
      if (s[i] == t[i]) continue;
      final c = cost[ord(s[i])][ord(t[i])];
      if (c == maxx) return -1;
      res += c;
    }
    return res;
  }

  int ord(String w) => w.codeUnitAt(0) - a;
}
