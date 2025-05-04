class Solution {
  int numEquivDominoPairs(List<List<int>> dominoes) {
    final hm = <String, int>{};
    for (final d in dominoes){
        d.sort();
        final s = d.map((i) => '$i')
                   .join('');
        hm[s] = (hm[s] ?? 0) + 1;
    }
    return hm.values
            .where((v) => v > 1)
            .map((v) => (v * (v - 1)) ~/ 2)
            .fold(0, (a, b) => a + b);
  }
}