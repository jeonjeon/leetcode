import 'dart:math';
class Solution {
  int maxDistance(List<List<int>> arrays) {
    (int, int) mx1 = (-10001, 0);
    (int, int) mx2 = (-10001, 0);
    (int, int) mn1 = (10001, 0);
    (int, int) mn2 = (10001, 0);
    for (int i = 0; i < arrays.length; i++){
      final arr = arrays[i];
      final mn = arr.first;
      final mx = arr.last;
      // 작은수
      if (mn1.$1 > mn){
        mn2 = mn1;
        mn1 = (mn, i);
      } else if (mn2.$1 > mn){
        mn2 = (mn, i);
      }
      // 큰수
      if (mx1.$1 < mx){
        mx2 = mx1;
        mx1 = (mx, i);
      } else if (mx2.$1 < mx){
        mx2 = (mx, i);
      }
    }
    final (mx1Num, mx1Idx) = mx1;
    final (mn1Num, mn1Idx) = mn1;
    final (mx2Num, mx2Idx) = mx2;
    final (mn2Num, mn2Idx) = mn2;
    if (mx1Idx != mn1Idx) return mx1Num - mn1Num;
    return max(mx1Num - mn2Num, mx2Num - mn1Num);
  }
}