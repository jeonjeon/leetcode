class Solution {
  int maximumImportance(int n, List<List<int>> roads) {
    final hm = <int, int>{};
    for (final r in roads){
      hm[r[0]] = (hm[r[0]] ?? 0) + 1;
      hm[r[1]] = (hm[r[1]] ?? 0) + 1;
    }
    final arr = hm.values.toList()..sort((a,b) => b.compareTo(a));
    return arr.map((a) => a * n--).reduce((a, b)=> a + b);
  }
}