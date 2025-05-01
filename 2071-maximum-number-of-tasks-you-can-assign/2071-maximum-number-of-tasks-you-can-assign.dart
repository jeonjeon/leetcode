import 'dart:collection';
import 'dart:math';
class Solution {
  int maxTaskAssign(List<int> tasks, List<int> workers, int pills, int strength) {
    tasks.sort();
    workers.sort();
    int l = 0, r = min(tasks.length, workers.length);
    // 바이너리 서치로 최댜한 커버 가능한 업무 개수 찾기
    while (l < r){
      final m = ((l + r) / 2).ceil();
      if (bs(m, tasks.take(m).toList(), workers.skip(workers.length - m).toList(), pills, strength)){
        l = m;
      } else {
        r = m - 1;
      }
    }
    return l;
  }
  // binary search
  bool bs(int target, List<int> tasks, List<int> workers, int pills, int strength){
    final stm = SplayTreeMap<int, int>();
    workers.forEach((w) => stm[w] = (stm[w] ?? 0) + 1);

    while (tasks.isNotEmpty){
      // 일꾼으로 커버
      final lastWorker = stm.lastKey()!;
      if (lastWorker >= tasks.last){
        removeLast(stm, stm.lastKey()!);
        tasks.removeLast();
        continue;
      }
      // 약 없거나 약빨아도 안되면
      if (pills == 0 || tasks.last > lastWorker + strength){
        return false;
      }
      // 약빨 효율 극대화 작업자 찾기
      removeLast(stm, stm.firstKeyAfter(tasks.last - strength - 1)!);
      tasks.removeLast();
      pills--;
    }
    return true;
  }
  // splay tree map 에서 특정 엘레멘트 제거
  void removeLast(SplayTreeMap<int, int> stm, int target){
    stm[target] = stm[target]! - 1;
    if (stm[target]! == 0) stm.remove(target);
  }

}
