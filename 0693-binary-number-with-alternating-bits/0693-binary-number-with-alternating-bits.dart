class Solution {
  bool hasAlternatingBits(int n) {
    int m = n & 1;
    n >>= 1;
    while (n > 0){
      // print('n: ${n.toRadixString(2)}');
      // print('m: ${m.toRadixString(2)}');
      if (n & 1 == m) return false;
      m = n & 1;
      n >>= 1;
    }
    return true;
  }
}