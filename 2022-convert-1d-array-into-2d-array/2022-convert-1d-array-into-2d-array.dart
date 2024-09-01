class Solution {
  List<List<int>> construct2DArray(List<int> original, int m, int n) {
    if (m * n != original.length) return [];
    final res = <List<int>>[];
    for (int i = 0; i < m; i++){
      res.add(original.sublist(i * n, (i + 1) * n));
    }
    return res;
  }
}