import 'dart:collection';
class Solution {
  List<int> findAllPeople(int n, List<List<int>> meetings, int firstPerson) {
    final res = <int>{};
    meetings.add([0, firstPerson, 0]);
    final stm = SplayTreeMap<int, List<List<int>>>();
    for (final [x, y, t] in meetings){
      (stm[t] ??= []).add([x, y]);
    }
    // print(stm);
    final parent = List.generate(n, (i) => i);
    for (final edges in stm.values){
      // print('edges: $edges');
      for (final [x, y] in edges){
        union(parent, x, y);
      }
      for (final [x, y] in edges){
        if (find(parent, x) == 0) {
          res.addAll({x, y});
        } else{
          parent[x] = x;
          parent[y] = y;
        }
      }
      // print('parent: $parent');
      // print('res: $res');
    }
    return res.toList();
  }
  int find(List<int> parent, int child){
    if (parent[child] != child){
      parent[child] = find(parent, parent[child]);
    }
    return parent[child];
  }
  void union(List<int> parent, int a, int b){
    a = find(parent, a);
    b = find(parent, b);
    if (a < b){
      parent[b] = a;
    } else {
      parent[a] = b;
    }
  }
}