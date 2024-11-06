import 'dart:collection';
class Solution {
  bool canSortArray(List<int> nums) {
    final stm = SplayTreeMap<int, List<int>>();
    final link = List.generate(nums.length, (n) => n);
    for (int i = 0; i < nums.length; i++){
        (stm[nums[i]] ??= []).add(i);
        if (i > 0){
            final p = getSetBits(nums[i - 1]);
            final c = getSetBits(nums[i]);
            if (p == c){
                link[i] = link[i - 1];
            }
        }
    }
    int pos = 0;
    // print(stm);
    for (final idxs in stm.values){
        for (final i in idxs){
            if (link[i] > pos) return false;
            pos++;
        }
    }
    // print(link);
    return true;
  }
  int getSetBits(int n){
    int res = 0;
    while (n > 0){
      res += n & 1;
      n >>= 1;
    }
    return res;
  }
}