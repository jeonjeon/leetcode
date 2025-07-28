class Solution {
  int countMaxOrSubsets(List<int> nums) {
    int res = 0;
    final mx = nums.reduce((a, b) => a | b);
    final tot = 1 << nums.length;
    for (int i = 1; i < tot; i++){
      int cur = 0;
      for (int j = 0; (1 << j) <= i; j++){
        if ((1 << j) & i == 0) continue;
        cur |= nums[j];
        if (cur == mx) {
          res++;
          break;
        }
      }
    }
    return res;
  }
}