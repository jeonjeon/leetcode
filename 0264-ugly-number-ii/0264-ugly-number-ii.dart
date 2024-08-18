import 'dart:math';
class Solution {
  int nthUglyNumber(int n) {
    int i2 = 0, i3 = 0, i5 = 0;
    final arr = <int>[1];
    while (arr.length < n){
      final m = arr.add(min(arr[i2] * 2, min(arr[i3] * 3, arr[i5] * 5)));
      if (arr[i2] * 2 == arr.last) i2++;
      if (arr[i3] * 3 == arr.last) i3++;
      if (arr[i5] * 5 == arr.last) i5++;
    }
    return arr.last;
  }
}