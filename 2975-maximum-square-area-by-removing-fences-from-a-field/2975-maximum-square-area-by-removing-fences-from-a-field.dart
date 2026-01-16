import 'dart:math';
class Solution {
  int maximizeSquareArea(int m, int n, List<int> hFences, List<int> vFences) {
    final mod = 1000000007;
    final hSet = hFences.toSet()..addAll({1, m});
    final vSet = vFences.toSet()..addAll({1, n});
    final hField = <int>{};
    final vField = <int>{};
    for (final h1 in hSet){
      for (final h2 in hSet){
        if (h1 == h2) continue;
        hField.add((h1 - h2).abs());
      }
    }
    for (final v1 in vSet){
      for (final v2 in vSet){
        if (v1 == v2) continue;
        vField.add((v1 - v2).abs());
      }
    }
    final len = hField.intersection(vField)
                      .fold(-1, max);
    if (len == -1) return -1;
    return len * len % mod;
  }
}