import 'dart:collection';
class Solution {
  int longestSubarray(List<int> nums, int limit) {
    int l = 0;
    int r = nums.length;
    while (l <= r){
      final mid = ((l + r) / 2).ceil();
      if (can(nums, limit, mid)){
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    return r;
  }
  bool can(List<int> nums, int limit, int mid){
    final stm = SplayTreeMap<int, int>((a, b) => a.compareTo(b));
    for (int i = 0; i < nums.length; i++){
      final n = nums[i];
      stm[n] = (stm[n] ?? 0) + 1;
      if (mid <= i){
        stm[nums[i - mid]] = stm[nums[i - mid]]! - 1;
        if (stm[nums[i - mid]]! == 0){
          stm.remove(nums[i - mid]);
        }
      }
      if (mid - 1 <= i){
        final low = stm.firstKey()!;
        final high = stm.lastKey()!;
        //print('i: $i, low: $low, high: $high');
        final diff = high - low;
        if (diff <= limit) return true;
      }
    }
    return false;
  }
}