import 'dart:math';
class Solution {
  int repairCars(List<int> rnk, int car) {
    rnk.sort();
    int l = 0, r = rnk.last * car * car;
    while (l < r){
      final t = (l + r) ~/ 2;
      if (bs(rnk, car, t)){
        r = t;
      } else {
        l = t + 1;
      }
    }
    return l;
  }
  bool bs(List<int> rnk, int car, int t){
    for (final r in rnk){
      car -= sqrt(t ~/ r).floor();
      if (car <= 0) return true;
    }
    return false;
  }
}