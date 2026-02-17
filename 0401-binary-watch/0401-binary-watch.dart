class Solution {
  List<String> readBinaryWatch(int t) {
    final lim = 1 << 10;
    final res = <String>[];
    for (int i = 0; i < lim; i++){
      if (countBin(i) != t) continue;
      final (hour, min) = getTime(i);
      if (hour > 11 || min > 59) continue;
      res.add('$hour:' + '$min'.padLeft(2, '0'));
    }
    return res;
  }
  (int, int) getTime(int n){
    final minMask = (1 << 6) - 1;
    final hour = n >> 6;
    final min = n & minMask;
    return (hour, min);
  }
  int countBin(int n){
    int res = 0;
    while (n > 0){
      res += n & 1;
      n >>= 1;
    }
    return res;
  }
}