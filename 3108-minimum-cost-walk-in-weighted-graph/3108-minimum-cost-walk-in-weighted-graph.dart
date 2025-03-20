class Solution {
  List<int> minimumCost(int n, List<List<int>> edges, List<List<int>> query) {
    int mask = 1;
    while (mask < 100000){
      mask <<= 1;
      mask++;
    }
    final parent = List.generate(n, (i) => (i, -1));
    final res = <int>[];
    for (final edg in edges){
      union(parent, edg[0], edg[1], edg[2]);
      // print(parent);
    }
    // print(parent);
    for (final q in query){
      final (aP, aAnd) = find(parent, q[0], mask);
      final (bP, bAnd) = find(parent, q[1], mask);
      if (q[0] == q[1]) {
        res.add(0);
      } else if (aP == bP){
        res.add(aAnd & bAnd);
      } else {
        res.add(-1);
      }
    }
    return res;
  }
  void union(List<(int, int)> parent, int a,  int b, int and){
    final (aP, aAnd) = find(parent, a, and);
    final (bP, bAnd) = find(parent, b, and);
    and = aAnd & bAnd;
    // print('a: $a, b: $b, aP: $aP, aAnd: $aAnd, bP: $bP, bAnd: $bAnd, and: $and');
    if (aP < bP){
      parent[aP] = (aP, and);
      parent[bP] = (aP, and);
      return;
    }
    parent[aP] = (bP, and);
    parent[bP] = (bP, and);
  }
  (int, int) find(List<(int, int)> parent, int x, int and){
    var (nX, nAnd) = parent[x];
    if (nAnd < 0){
      parent[x] = (nX, and);
    } else {
      parent[x] = (nX, and & nAnd);
    }
    nAnd = parent[x].$2;
    if (nX != x){
      parent[x] = find(parent, nX, nAnd);
    }
    return parent[x];
  }
}