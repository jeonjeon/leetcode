import 'dart:math';
class Solution {
  double averageWaitingTime(List<List<int>> customers) {
    int finTime = 0;
    int res = 0;
    for (final cus in customers){
      finTime = max(finTime, cus[0]) + cus[1];
      res += finTime - cus[0];
    }
    return res / customers.length;
  }
}