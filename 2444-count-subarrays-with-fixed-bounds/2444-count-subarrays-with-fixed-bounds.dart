import 'dart:collection';
class Solution {
  int countSubarrays(List<int> nums, int minK, int maxK) {
    int res = 0;
    final stm = SplayTreeMap<int, int>();
    int l = 0, over = -1;
    for (int r = 0; r < nums.length; r++){
      if (nums[r] > maxK || nums[r] < minK) {
        stm.clear();
        l = r + 1;
        over = r;
        continue;
      }
      stm[nums[r]] = (stm[nums[r]] ?? 0) + 1;
      while (stm.firstKey()! == minK && stm.lastKey()! == maxK){
        if (nums[l] == stm.firstKey()! && stm[nums[l]]! == 1) break;
        if (nums[l] == stm.lastKey()! && stm[nums[l]]! == 1) break;
        stm[nums[l]] = stm[nums[l]]! - 1;
        if (stm[nums[l]] == 0) stm.remove(nums[l]);
        l++;
        // print('l: $l, stm: $stm');
      }
      // print('r: $r, l: $l, stm: $stm');
      if (stm.firstKey()! == minK && stm.lastKey()! == maxK){
        res += l - over;
        // print('res: $res');
      }
    }
    return res;
  }
}