import 'dart:collection';
class Solution {
  List<bool> checkIfPrerequisite(int numCourses, List<List<int>> prerequisites, List<List<int>> queries) {
    final indegree = List.filled(numCourses, 0);
    final edges = List.generate(numCourses, (_) => <int>[]);
    for (final p in prerequisites){
        indegree[p[1]]++;
        edges[p[0]].add(p[1]);
    }
    var q = Queue<int>();
    final topologic = List.generate(numCourses, (i) => <int>{i});
    for (int i = 0; i < indegree.length; i++){
        if (indegree[i] == 0) {
            q.add(i);
        }
    }
    while (q.isNotEmpty){
        final cur = q.removeFirst();
        // print('cur: $cur');
        for (final next in edges[cur]){
            topologic[next].addAll(topologic[cur]);
            // print('next: $next, top: ${topologic[next]}');
            if (--indegree[next] == 0){
                q.add(next);
            }
        }
    }
    // print(topologic);
    final res = <bool>[];
    for (final query in queries){
        res.add(topologic[query[1]].contains(query[0]));
    }
    return res;
  }
}