import 'dart:collection';

int _compare(int a, int b) => b.compareTo(a);

class TaskManager {
  // taskId: [userId, priority]
  final taskUserPriorityMap = <int, List<int>>{};
  
  // priority: {taskId set}
  final priorityToTasksMap = SplayTreeMap<int, SplayTreeSet<int>>(_compare);
  
  TaskManager(List<List<int>> tasks) {
    for (final task in tasks) {
      final [userId, taskId, priority] = task;
      taskUserPriorityMap[taskId] = [userId, priority];
      (priorityToTasksMap[priority] ??= SplayTreeSet<int>(_compare)).add(taskId);
    }
  }
  
  void add(int userId, int taskId, int priority) {
    taskUserPriorityMap[taskId] = [userId, priority];
    (priorityToTasksMap[priority] ??= SplayTreeSet<int>(_compare)).add(taskId);
  }
  
  void edit(int taskId, int newPriority) {
    final [userId, currentPriority] = taskUserPriorityMap[taskId]!;
    rmv(taskId);
    add(userId, taskId, newPriority);
  }
  
  void rmv(int taskId) {
    final [userId, priority] = taskUserPriorityMap[taskId]!;
    priorityToTasksMap[priority]!.remove(taskId);
    if (priorityToTasksMap[priority]!.isEmpty) {
      priorityToTasksMap.remove(priority);
    }
    taskUserPriorityMap.remove(taskId);
  }
  
  int execTop() {
    final highestPriority = priorityToTasksMap.firstKey();
    if (highestPriority == null) return -1;
    
    final taskId = priorityToTasksMap[highestPriority]!.first;
    final [userId, priority] = taskUserPriorityMap[taskId]!;
    rmv(taskId);
    return userId;
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