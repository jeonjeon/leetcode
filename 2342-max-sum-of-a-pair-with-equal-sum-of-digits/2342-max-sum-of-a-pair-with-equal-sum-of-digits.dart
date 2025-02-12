import 'dart:math';
class Solution {
  int maximumSum(List<int> nums) {
    final arr = List.filled(100, -1);
    var res = -1;
    for (int i = 0; i < nums.length; i++){
        var n = nums[i];
        var sum = 0;
        while (n > 0){
            sum += n % 10;
            n ~/= 10;
        }
        if (arr[sum] > 0){
            res = max(res, arr[sum] + nums[i]);
        }
        arr[sum] = max(arr[sum], nums[i]);
    }
    return res;
  }
}