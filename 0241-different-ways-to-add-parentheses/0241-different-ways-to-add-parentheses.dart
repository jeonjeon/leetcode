import 'dart:collection';
class Solution {
  List<int> diffWaysToCompute(String exp) {
    final e = int.tryParse(exp);
    if (e != null) return [e];
    final res = <int>[];
    for (int i = 0; i < exp.length; i++){
      if (int.tryParse(exp[i]) != null) continue;
      final left = diffWaysToCompute(exp.substring(0, i));
      final right = diffWaysToCompute(exp.substring(i + 1));
      // print('left: $left, cur: $cur, right: $right');
      for (final l in left){
        for (final r in right){
          final n = switch(exp[i]){
            '+' => l + r,
            '-' => l - r,
            '*' => l * r,
            _ => 0,
          };
          res.add(n);
        }
      }
    }
    return res;
  }
}