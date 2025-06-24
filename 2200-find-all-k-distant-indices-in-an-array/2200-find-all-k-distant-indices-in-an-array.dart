import 'dart:math';
class Solution {
  List<int> findKDistantIndices(List<int> nums, int key, int k) {
    final l = nums.length;
    final arr = List.filled(l + 1, 0);
    final res = <int>[];
    for (int i = 0; i < l; i++){
        if (nums[i] == key){
            arr[max(0, i - k)]++;
            arr[min(l, i + k + 1)]--;
        }
    }
    int cur = 0;
    for (int i = 0; i < l; i++){
        cur += arr[i];
        if (cur > 0) res.add(i);
    }
    return res;
  }
}