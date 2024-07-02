import 'dart:math';
class Solution {
  List<int> intersect(List<int> nums1, List<int> nums2) {
    final hm = <int, int>{};
    final hm2 = <int, int>{};
    final res = <int>[];
    for (final n in nums1) hm[n] = (hm[n] ?? 0) + 1;
    for (final n in nums2){
      if (!hm.containsKey(n)){
        continue;
      }
      hm2[n] = (hm2[n] ?? 0) + 1;
    }
    for (final key in hm.keys){
      if (!hm2.containsKey(key)){
        continue;
      }
      final value = min(hm[key]!, hm2[key]!);
      res.addAll(List.filled(value, key));
    }
    return res;
  }
}