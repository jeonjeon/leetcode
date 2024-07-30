import 'dart:math';
class Solution {
  int minimumDeletions(String s) {
    final a = List.filled(s.length, 0);
    final b = List.filled(s.length, 0);
    for (int i = 0; i < s.length; i++){
      final bi = s.length - i - 1;
      if (s[i] == 'a') a[i]++;
      if (s[bi] == 'b') b[bi]++;
      if (i > 0) {
        a[i] += a[i - 1];
        b[bi] += b[bi + 1];
      }
    }
    int remains = max(a.last, b.first);
    for (int i = 0; i < s.length - 1; i++){
      remains = max(remains, a[i] + b[i + 1]);
    }
    return s.length - remains;
  }
}