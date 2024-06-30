class Solution {
  int maxNumEdgesToRemove(int n, List<List<int>> edges) {
    final visit = <int>{};
    final alice = List.generate(n + 1, (i) => i);
    final bob = List.generate(n + 1, (i) => i);
    edges.sort((a, b) => b[0].compareTo(a[0]));
    for (int i = 0; i < edges.length; i++){
      final e = edges[i];
      // both
      if (e[0] == 3){
        final a1 = find(alice, e[1]);
        final a2 = find(alice, e[2]);
        final b1 = find(bob, e[1]);
        final b2 = find(bob, e[2]);
        if (a1 != a2 || b1 != b2){
          union(a1, a2, alice);
          union(b1, b2, bob);
          visit.add(i);
        }
        continue;
      }
      //bob
      if (e[0] == 2){
        final b1 = find(bob, e[1]);
        final b2 = find(bob, e[2]);
        if (b1 != b2){
          union(b1, b2, bob);
          visit.add(i);
        }
        continue;
      }
      //alice
      final a1 = find(alice, e[1]);
      final a2 = find(alice, e[2]);
      if (a1 != a2){
        union(a1, a2, alice);
        visit.add(i);
      }
    }
    //print('alice: $alice');
    //print('bob: $bob');
    if (alice.any((a) => find(alice,a) > 1) || bob.any((b) => find(bob,b) > 1)){
      return -1;
    }
    return edges.length - visit.length;
  }
  void union(int a, int b, List<int> parent){
    a = find(parent, a);
    b = find(parent, b);
    if (a < b){
      parent[b] = a;
    } else {
      parent[a] = b;
    }
  }
  int find(List<int> parent, int a){
    if (parent[a] != a){
      parent[a] = find(parent, parent[a]);
    }
    return parent[a];
  }
}