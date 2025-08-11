class Solution {
  List<int> productQueries(int n, List<List<int>> queries) {
    final mod = 1000000007;
    // get powers
    final pow = <int>[];
    for (int i = 0; 1 << i <= n; i++) {
      if ((1 << i) & n == 0) continue;
      pow.add(1 << i);
    }
    // get result
    final res = <int>[];
    for (final [l, r] in queries){
      int prd = 1;
      for (int i = l; i <= r; i++){
        prd = (prd * pow[i]) % mod;
      }
      res.add(prd);
    }
    return res;
  }
}