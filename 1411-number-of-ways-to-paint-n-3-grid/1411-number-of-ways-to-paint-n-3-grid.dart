class Solution {
  int numOfWays(int n) {
    final mod = 1000000007;
    int c2 = 6, c3 = 6;
    for (int i = 1; i < n; i++){
      final nc2 = (c2 * 3 + c3 * 2) % mod;
      final nc3 = (c2 * 2 + c3 * 2) % mod;
      c2 = nc2;
      c3 = nc3;
    }
    return (c2 + c3) % mod;
  }
}