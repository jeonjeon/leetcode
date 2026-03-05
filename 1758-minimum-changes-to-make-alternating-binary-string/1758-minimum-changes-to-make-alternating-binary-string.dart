import 'dart:math';
class Solution {
  int minOperations(String s) {
    final zero = ops(s, 0);
    final one = ops(s, 1);
    return min(zero, one);
  }
  int ops(String s, int bit){
    int res = 0;
    for (int i = 0; i < s.length; i++){
      if (int.parse(s[i]) != bit) res++;
      bit ^= 1;
    }
    return res;
  }
}