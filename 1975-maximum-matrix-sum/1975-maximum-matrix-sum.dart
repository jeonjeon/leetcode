import 'dart:math';
class Solution {
  int maxMatrixSum(List<List<int>> matrix) {
    int mn = 100001, sum = 0;
    bool neg = false;
    for (final row in matrix){
        for (final v in row){
            if (v < 0) neg = !neg;
            mn = min(mn, v.abs());
            sum += v.abs();
        }
    }
    if (neg){
        sum -= mn * 2;
    }
    return sum;
  }
}