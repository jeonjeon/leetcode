import 'dart:math';
import 'dart:collection';
class Solution {
  int magnificentSets(int n, List<List<int>> edges) {
    int res = 0;
    final hm = <int, List<int>>{};
    final parent = List.generate(n + 1, (i) => i);
    for (final e in edges){
        (hm[e[0]] ??= []).add(e[1]);
        (hm[e[1]] ??= []).add(e[0]);
    }
    for (final e in edges){
        union(parent, e[0], e[1]);
    }
    final groups = <int, List<int>>{};
    for (int i = 1; i < n + 1; i++){
        final p = find(parent, i);
        (groups[p] ??= []).add(i);
    }
    // print(groups);
    for (final group in groups.values){
        int g = -1;
        final len = group.length;
        for (final node in group){
            g = max(g, bfs(hm, node, len));
        }
        // print('group: $group');
        // print('g: $g');
        if (g == -1) return -1;
        res += g;
    }
    return res;
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
  int bfs(Map<int,List<int>> hm, int start, int n){
    int depth = 0;
    var q = Queue<int>()..add(start);
    var visit = <int>{start};
    while (q.isNotEmpty){
        final temp = Queue<int>();
        final bros = <int>{};
        while (q.isNotEmpty){
            final cur = q.removeFirst();
            bros.add(cur);
            final next = hm[cur] ?? <int>[];
            for (final n in next){
                if (bros.contains(n)) {
                    print(n);
                    return -1;
                }
                if (visit.contains(n)) continue;
                visit.add(n);
                temp.add(n);
            }
        }
        depth++;
        q = temp;
    }
    if (visit.length != n) return -1;
    return depth;
  }
}