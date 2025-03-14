import 'dart:math';
class Solution {
  int maximumCandies(List<int> c, int k) {
    int l = 0, r = c.reduce(max);
    while (l < r){
      final p = ((l + r) / 2).ceil();
      if (canDivided(c, k, p)){
        l = p;
      } else {
        r = p - 1;
      }
    }
    return l;
    
  }
  bool canDivided(List<int> c, int k, int p)
    => c.map((candy) => candy ~/ p).fold(0, (a, b) => a + b) >= k;
}