class Solution {
  List<int> sumZero(int n) {
    final res = <int>[];
    final mod = n % 2, div = n ~/ 2;
    for (int i = 1; i <= div; i++){
      res.add(-i);
      res.add(i);
    }
    if (mod > 0){
      res.add(0);
    }
    return res;
  }
}
