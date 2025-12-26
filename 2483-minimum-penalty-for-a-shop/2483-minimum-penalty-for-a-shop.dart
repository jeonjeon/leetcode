import 'dart:math';
class Solution {
  int bestClosingTime(String cust) {
    int res = 0, tot = cust.length;
    final right = List.filled(cust.length + 1, 0);
    for (int i = cust.length - 1; i >= 0; i--){
      if (cust[i] == 'Y') right[i]++;
      if (i < cust.length - 1) right[i] += right[i + 1];
    }
    // print(right);
    int left = 0;
    for (int i = 0; i <= cust.length; i++){
      // print('i: $i, left: $left, right: ${right[i]}');
      if (tot > left + right[i]) {
        res = i;
        tot = left + right[i];
      }
      if (i < cust.length && cust[i] == 'N') left++;
    }
    return res;
  }
}