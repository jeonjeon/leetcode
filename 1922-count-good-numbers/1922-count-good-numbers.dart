class Solution {
  final mod = 1000000007;
  final hm = <(int, bool), int>{};
  int countGoodNumbers(int n) {
    return recur(n, true);
  }
  int recur(int n, bool even){
    if (hm.containsKey((n, even))){
      return hm[(n, even)]!;
    }
    if (n == 0) return 1;
    if (n == 1) return even ? 5 : 4;
    int res = 1;
    final half = n ~/ 2;
    res = (res * recur(half, even)) % mod;
    if (half % 2 == 1) even = !even;
    res = (res * recur(half, even)) % mod;
    if (half % 2 == 1) even = !even;
    res = (res * recur(n % 2, even)) % mod;
    hm[(n, even)] = res;
    return res;
  }
}