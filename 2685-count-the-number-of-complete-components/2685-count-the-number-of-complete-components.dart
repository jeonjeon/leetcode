class Solution {
  final visit = <int>{};
  int countCompleteComponents(int n, List<List<int>> edges) {
    int res = 0;
    final parent = List.generate(n, (i) => i);
    final arr = List.generate(n, (_) => <int>[]);
    final cnt = List.filled(n, 1);
    for (final [e1, e2] in edges){
      union(parent, e1, e2);
      cnt[e1]++;
      cnt[e2]++;
    }
    for (int i = 0; i < n; i++){
      arr[find(parent, i)].add(i);
    }
    // print('parent: $parent, arr: $arr, cnt: $cnt');
    for (final links in arr){
      if (links.isEmpty) continue;
      if (links.every((l) => cnt[l] == links.length)) res++;
    }
    return res;
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
  int find(List<int> parent, int c){
    if (parent[c] != c){
      parent[c] = find(parent, parent[c]);
    }
    return parent[c];
  }
}