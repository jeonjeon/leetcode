import 'dart:math';
class Solution {
  String robotWithString(String s) {
    final a = 'a'.codeUnitAt(0);
    final arr = s.split('')
                 .map((c) => c.codeUnitAt(0) - a)
                 .toList();
    final suffixMin = List.filled(s.length, 0);
    suffixMin.last = arr.last;
    for (int i = s.length - 2; i >= 0; i--){
      suffixMin[i] = min(arr[i], suffixMin[i + 1]);
    }
    final stack = <int>[];
    final res = <int>[];
    for (int i = 0; i < arr.length; i++){
      while (stack.isNotEmpty && stack.last <= suffixMin[i]){
        res.add(stack.removeLast());
      }
      stack.add(arr[i]);
    }
    res.addAll(stack.reversed);
    return res.map((n) => n + a)
              .map(String.fromCharCode)
              .join('');
  }
}