class Solution {
  final mod = 1000000007;
  final memo = <(int, bool), int>{};
  int countGoodNumbers(int n) {
    return recur(n, true);
  }
  int recur(int n, bool even){
    // memoization for performance
    if (memo.containsKey((n, even))){
      return memo[(n, even)]!;
    }
    if (n == 0) return 1;
    if (n == 1) return even ? 5 : 4;
    int res = 1;
    final half = n ~/ 2;
    res = (res * recur(half, even)) % mod;
    // half is odd means that starting number of the next half needs to be flipped
    if (half % 2 == 1) even = !even;
    res = (res * recur(half, even)) % mod;
    // half is odd means that remained number needs to be flipped also
    if (half % 2 == 1) even = !even;
    res = (res * recur(n % 2, even)) % mod;
    memo[(n, even)] = res;
    return res;
  }
}