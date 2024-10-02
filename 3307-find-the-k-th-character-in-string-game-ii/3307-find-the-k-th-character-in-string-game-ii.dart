import 'dart:io';
class Solution {
  String kthCharacter(int k, List<int> o) {
    final p = (log(k) / log(2)).ceil();
    int flip = 0;
    for (int i = p - 1; i >= 0; i--){
      final power = pow(2, i).toInt();
      if (k <= power) continue;
      k -= power;
      if (o[i] == 1){
        flip++;
      }
    }
    return String.fromCharCode('a'.codeUnitAt(0) + (flip % 26));
  }
}