import 'dart:collection';
import 'dart:math';
class Solution {
  List<int> solveQueries(List<int> nums, List<int> queries) {
    final res = <int>[];
    final n = nums.length;
    final hm = <int, SplayTreeMap<int, int>>{};
    for (int i = 0; i < n; i++){
      hm[nums[i]] ??= SplayTreeMap<int, int>();
      hm[nums[i]]![i] = 0;
    }
    for (int i = 0; i < queries.length; i++){
      int cur = n;
      final q = queries[i];
      final stm = hm[nums[q]];
      if (stm == null){
        res.add(-1);
        continue;
      }
      // print(stm);
      final first = stm.firstKey()!;
      final last = stm.lastKey()!;
      final l = stm.lastKeyBefore(q);
      final r = stm.firstKeyAfter(q);
      // print('query: ${nums[q]}, first: $first, last: $last, l: $l, r: $r');
      if (first < q) cur = min(cur, n - q + first);
      if (last > q) cur = min(cur, n - last + q);
      if (l != null) cur = min(cur, q - l);
      if (r != null) cur = min(cur, r - q);
      res.add(n == cur ? -1 : cur);
    }
    return res;
  }
}