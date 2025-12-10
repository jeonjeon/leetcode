class Solution {
  int countPermutations(List<int> comp) {
    final mod = 1000000007;
    if (comp.skip(1).any((n) => n <= comp[0])) {
      return 0;
    }
    int res = 1;
    for (int i = 1; i < comp.length; i++){
      res = (res * i) % mod;
    }
    return res;
  }
}