class Solution {
  int countPalindromicSubsequence(String s) {
    final a = 'a'.codeUnitAt(0);
    final first = List.filled(26, -1);
    final arr = List.generate(s.length + 1, (_) => List.filled(26, 0));
    for (int i = 0; i < s.length; i++){
      final cur = s.codeUnitAt(i) - a;
      for (int j = 0; j < 26; j++){
        arr[i + 1][j] = arr[i][j];
      }
      arr[i + 1][cur]++;
      if (first[cur] == -1){
        first[cur] = i;
      }
    }
    final visit = <int>{};
    int res = 0;
    for (int i = s.length - 1; i >= 0; i--){
      final cur = s.codeUnitAt(i) - a;
      if (visit.contains(cur)) continue;
      visit.add(cur);
      final f = first[cur];
      if (i - f < 2) continue;
      for (int j = 0; j < 26; j++){
        if (arr[i][j] - arr[f + 1][j] > 0){
          res++;
        }
      }
    }
    return res;
  }
}