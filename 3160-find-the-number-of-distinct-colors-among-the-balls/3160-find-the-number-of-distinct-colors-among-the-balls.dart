class Solution {
  List<int> queryResults(int limit, List<List<int>> queries) {
    final res = <int>[];
    final idx = <int, int>{};
    final color = <int, Set<int>>{};
    for (final q in queries){
        final i = q[0];
        final c = q[1];
        if ((idx[i] ?? 0) > 0){
            color[idx[i]!]!.remove(i);
            if (color[idx[i]!]!.isEmpty){
                color.remove(idx[i]!);
            }
        }
        idx[i] = c;
        (color[c] ??= {}).add(i);
        res.add(color.length);
    }
    return res;
  }
}