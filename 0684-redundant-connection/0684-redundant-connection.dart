class Solution {
  List<int> findRedundantConnection(List<List<int>> edges) {
    final parent = List.generate(edges.length + 1, (i) => i);
    for (final e in edges){
        if (union(parent, e[0], e[1])) return e;
    }
    return edges.last;
  }
  bool union(List<int> parent, int a, int b){
    a = getParent(parent, a);
    b = getParent(parent, b);
    if (a == b){
        return true;
    }
    if (a < b){
        parent[b] = a;
    } else {
        parent[a] = b;
    }
    return false;
  }
  int getParent(List<int> parent, int child){
    if (parent[child] != child){
        parent[child] = getParent(parent, parent[child]);
    }
    return parent[child];
  }
}