class Solution {
  final visit = <int>{}; 
  final acycle = <int>{};
  List<int> eventualSafeNodes(List<List<int>> graph) {
    for (int i = 0; i < graph.length; i++){
      recur(graph, i);
    }
    return acycle.toList()..sort();
  }
  bool recur(List<List<int>> graph, int index){
    if (graph[index].isEmpty){
      acycle.add(index);
      return true;
    }
    if (visit.contains(index)){
      return acycle.contains(index);
    }
    visit.add(index);
    var safe = true;
    for (final next in graph[index]){
      safe &= recur(graph, next);
    }
    if (safe){
      acycle.add(index);
    }
    return safe;
  }
}