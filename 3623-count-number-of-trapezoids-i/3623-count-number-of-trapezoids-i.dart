class Solution {
  int countTrapezoids(List<List<int>> points) {
    final mod = 1000000007;
    final hm = <int, int>{};
    int res = 0, x = 0;
    for (final [_, y] in points){
      hm[y] = (hm[y] ?? 0) + 1;
    }
    // print(hm);
    for (final cnt in hm.values){
      final tot = eu(cnt - 1);
      // print('cnt: $cnt, tot: $tot');
      res = (res + x * tot) % mod;
      x += tot;
    }
    return res;
  }
  int eu(int n) => (1 + n) * n ~/ 2;
}