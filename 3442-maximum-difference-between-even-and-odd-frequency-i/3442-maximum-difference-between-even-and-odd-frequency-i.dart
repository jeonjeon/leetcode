import 'dart:math';
class Solution {
  int maxDifference(String s) {
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < s.length; i++){
        final char = s.codeUnitAt(i) - a;
        arr[char]++;
    }
    int oddMax = 0, evenMin = s.length;
    for (final f in arr){
        if (f == 0) continue;
        if (f % 2 == 0){
            evenMin = min(f, evenMin);
            continue;
        }
        oddMax= max(f, oddMax);
    }
    return oddMax - evenMin;
  }
}