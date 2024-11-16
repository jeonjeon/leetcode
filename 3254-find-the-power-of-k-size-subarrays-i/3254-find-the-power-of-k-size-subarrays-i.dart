import 'dart:collection';
class Solution {
  List<int> resultsArray(List<int> nums, int k) {
    final res = <int>[];
    if (k == 1) return nums;
    final n = nums.length;
    final prefix = List.filled(n, 1);
    final stm = SplayTreeMap<int, int>((a, b) => b.compareTo(a));
    int l = 0;
    for (int i = 0; i < n; i++){
         stm[nums[i]] = (stm[nums[i]] ?? 0) + 1;
         if (i == 0) continue;
         if (nums[i] - nums[i - 1] == 1){
            prefix[i] += prefix[i - 1];
         }
         if (i < k - 1) continue;
         if (prefix[i] >= k){
            res.add(stm.firstKey()!);
         } else {
            res.add(-1);
         }
        //  print('stm: $stm, l: $l');
         if (stm[nums[l]]! == 1){
            stm.remove(nums[l]);
         } else {
            stm[nums[l]] = stm[nums[l]]! - 1;
         }
         l++;
    }
    // print('stm: $stm');
    // print('prefix: $prefix');
    return res;
  }
}