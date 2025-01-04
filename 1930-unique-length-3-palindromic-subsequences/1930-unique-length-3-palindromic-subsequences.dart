class Solution {
  int countPalindromicSubsequence(String s) {
    final a = 'a'.codeUnitAt(0);
    final arr = List.generate(26, (_) => <int>[]);
    final prefix = List.generate(s.length, (_) => List.filled(26, 0));
    for (int i = 0; i < s.length; i++){
        final code = s.codeUnitAt(i) - a;
        if (i > 0){
            for (int j = 0; j < 26; j++){
                prefix[i][j] = prefix[i - 1][j];
            }
        }
        prefix[i][code]++;
        arr[code].add(i);
    }
    int res = 0;
    for (int i = 0; i < 26; i++){
        if (arr[i].isEmpty || arr[i].last - arr[i].first <= 1) continue;
        final last = prefix[arr[i].last - 1];
        final first = prefix[arr[i].first];
        for (int i = 0; i < 26; i++){
            if (last[i] > first[i]) res++;
        }
    }
    return res;
  }
}