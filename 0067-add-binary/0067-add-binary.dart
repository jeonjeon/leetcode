import 'dart:math';
class Solution {
  String addBinary(String a, String b) {
    int rem = 0, al = a.length, bl = b.length;
    String res = '';
    for (int i = 0; i < max(al, bl); i++){
      int cur = rem;
      rem = 0;
      if (i < al && a[al - i - 1] == '1'){
        cur++;
      }
      if (i < bl && b[bl - i - 1] == '1'){
        cur++;
      }
      if (cur >= 2){
        rem = 1;
      }
      res = '${cur % 2}$res';
    }
    if (rem == 0) return res;
    return '$rem$res';
  }
}