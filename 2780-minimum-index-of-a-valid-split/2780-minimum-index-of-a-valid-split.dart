import 'dart:math';
class Solution {
  int minimumIndex(List<int> nums) {
    final len = nums.length;
    final cnt = <int, int>{};
    nums.forEach((n) => cnt[n] = (cnt[n] ?? 0) + 1);
    int mx = 0, n = 0;
    for (final e in cnt.entries){
      if (mx < e.value){
        mx = e.value;
        n = e.key;
      }
    }
    int cur = 0;
    for (int i = 0; i < len; i++){
      if (nums[i] == n) cur++;
      if (i + 1 < cur * 2 && len - i - 1 < (mx - cur) * 2) return i;
    }
    return -1;
  }
}