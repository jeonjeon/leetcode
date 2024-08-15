import 'dart:math';
class Solution {
  int numberOfArithmeticSlices(List<int> nums) {
    int res = 0;
    final arr = <Map<int, int>>[{}];
    for (int i = 1; i < nums.length; i++){
      arr.add({});
      for (int j = 0; j < i; j++){
        final diff = nums[i] - nums[j];
        final prev = arr[j][diff] ?? 0;
        arr[i][diff] = (arr[i][diff] ?? 0) + prev + 1;
        res += prev;
      }
    }
    return res;
  }
}