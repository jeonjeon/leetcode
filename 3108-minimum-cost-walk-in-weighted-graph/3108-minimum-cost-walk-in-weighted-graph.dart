class Solution {
  List<int> minimumCost(int n, List<List<int>> edges, List<List<int>> query) {
    final res = <int>[];
    final m = (2 << 17) - 1;
    final parent = List.generate(n, (i) => i);
    final weight = List.filled(n, m);
    for (final [a, b, w] in edges){
      final p = union(a, b, parent, weight, w);
    }
    for (final [s, t] in query){
      final sp = findParent(parent, s);
      final tp = findParent(parent, t);
      if (sp == tp){
        res.add(weight[sp]);
        continue;
      }
      res.add(-1);
    }
    return res;
  }
  int findParent(List<int> parent, int child,){
    if (parent[child] != child){
      parent[child] = findParent(parent, parent[child]);
    }
    return parent[child];
  }
  void union(int a, int b, List<int> parent, List<int> weight, int w){
    a = findParent(parent, a);
    b = findParent(parent, b);
    w &= weight[a] & weight[b];
    weight[a] = w;
    weight[b] = w;
    if (a < b){
      parent[b] = a;
    } else {
      parent[a] = b;
    }
  }
}