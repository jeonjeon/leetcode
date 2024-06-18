import 'dart:collection';
import 'dart:math';
class Solution {
  int maxProfitAssignment(List<int> diff, List<int> profit, List<int> worker) {
    int res = 0;
    final job = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    for (int i = 0; i < diff.length; i++){
      job[profit[i]] = min((job[profit[i]] ?? 100001), diff[i]);
    }
    worker.sort((a,b) => b.compareTo(a));
    //print('job: $job');
    //print('worker: $worker');
    for (final abil in worker){
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