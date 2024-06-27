class Solution {
  int findCenter(List<List<int>> edges) {
    final hm = <int, int>{};
    for (final e in edges){
      hm[e[0]] = (hm[e[0]] ?? 0) + 1;
      hm[e[1]] = (hm[e[1]] ?? 0) + 1;
    }
    final arr = hm.entries.toList()..sort((a, b)=> b.value.compareTo(a.value));
    return arr.first.key;
  }
}