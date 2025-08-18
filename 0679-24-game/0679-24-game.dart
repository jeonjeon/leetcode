class Solution {
  final done = int.parse('1111', radix:2);
  bool judgePoint24(List<int> cards) {
    final dp = <int, Set<double>>{};
    for (int i = 0; i < 4; i++){
      (dp[1 << i] ??= {}).add(cards[i].toDouble());
    }
    for (int i = 0; i < 3; i++){
      final cur = <int, Set<double>>{};
      for (final e1 in dp.entries){
        for (final e2 in dp.entries){
          final key1 = e1.key;
          final key2 = e2.key;
          if (key1 & key2 > 0) continue;
          final newKey = key1 | key2;
          cur[newKey] ??= {};
          for (final val1 in e1.value){
            for (final val2 in e2.value){
              // +
              cur[newKey]!.add(val1 + val2);
              // -
              cur[newKey]!.add(val1 - val2);
              cur[newKey]!.add(val2 - val1);
              // * 
              cur[newKey]!.add(val1 * val2);
              // /
              if (val2 != 0) cur[newKey]!.add(val1 / val2);
              if (val1 != 0) cur[newKey]!.add(val2 / val1);
            }
          }
        }
      }
      dp.addAll(cur);
    }
    return dp[15]!.any((d) => (d - 24.0).abs() <= 0.0001);
  }
}