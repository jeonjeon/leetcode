import 'dart:collection';
import 'dart:math';
class Solution {
  int continuousSubarrays(List<int> nums) {
    int res = 0;
    final stm = SplayTreeMap<int, int>();
    int l = 0;
    for (int r = 0; r < nums.length; r++){
        final n = nums[r];
        stm[n] = (stm[n] ?? 0) + 1;
        while (stm.isNotEmpty && (stm.firstKey()! - stm.lastKey()!).abs() > 2){
            stm[nums[l]] = stm[nums[l]]! - 1;
            if (stm[nums[l]] == 0) stm.remove(nums[l]);
            l++;
        }
        res += r - l + 1;
    }
    return res;
  }
}