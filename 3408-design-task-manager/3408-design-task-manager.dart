import 'dart:collection';
class TaskManager {
  final tup = <int, List<int>>{};
  final pt = SplayTreeMap<int, SplayTreeSet<int>>((a, b) => b.compareTo(a));
  TaskManager(List<List<int>> tasks) {
    for (final task in tasks){
      final [u, t, p] = task;
      tup[t] = [u, p];
      (pt[p] ??= SplayTreeSet<int>((a, b) => b.compareTo(a))).add(t);
    }
  }
  
  void add(int u, int t, int p) {
    tup[t] = [u, p];
    (pt[p] ??= SplayTreeSet<int>((a, b) => b.compareTo(a))).add(t);
  }
  
  void edit(int t, int np) {
    final [u, p] = tup[t]!;
    pt[p]!.remove(t);
    if (pt[p]!.isEmpty) pt.remove(p);
    (pt[np] ??= SplayTreeSet<int>((a, b) => b.compareTo(a))).add(t);
    tup[t] = [u, np];
  }
  
  void rmv(int t) {
    final [u, p] = tup[t]!;
    pt[p]!.remove(t);
    if (pt[p]!.isEmpty) pt.remove(p);
    tup.remove(t);
  }
  
  int execTop() {
    final key = pt.firstKey();
    if (key == null) return -1;
    final t = pt[key]!.first;
    final [u, p] = tup[t]!;
    pt[p]!.remove(t);
    if (pt[p]!.isEmpty) pt.remove(p);
    tup.remove(t);
    return u;
  }
}
/**
 * Your TaskManager object will be instantiated and called as such:
 * TaskManager obj = TaskManager(tasks);
 * obj.add(userId,taskId,priority);
 * obj.edit(taskId,newPriority);
 * obj.rmv(taskId);
 * int param4 = obj.execTop();
 */