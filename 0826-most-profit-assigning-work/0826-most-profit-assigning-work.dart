import 'dart:collection';
import 'dart:math';
class Solution {
  int maxProfitAssignment(List<int> diff, List<int> profit, List<int> worker) {
    int res = 0;
    final work= SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    final job = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    for (int i = 0; i < diff.length; i++){
      job[profit[i]] = min((job[profit[i]] ?? 100001), diff[i]);
    }
    for (int i = 0; i < worker.length; i++){
      work[worker[i]] = (work[worker[i]] ?? 0) + 1;
    }
    //print('job: $job');
    //print('work: $work');
    while (work.isNotEmpty){
      final abil = work.firstKey()!;
      final cnt = work[abil]!;
      work[abil] = cnt - 1;
      if (work[abil] == 0){
        work.remove(abil);
      } 
      while (job.isNotEmpty){
        final key = job.firstKey()!;
        final j = job[key]!;
        if (j > abil){
          job.remove(key);
          continue;
        }
        //print('abil: $abil, j: $j');
        res += key;
        break;
      }
    }
    return res;
  }
}