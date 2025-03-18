import 'dart:math';
class Solution {
  int longestNiceSubarray(List<int> nums) {
    final arr = List.filled(30, 0);
    int l = 0, res = 0;
    for (int r = 0; r < nums.length; r++){
        bin(arr, nums[r], 1);
        while (arr.any((a) => a > 1)){
            bin(arr, nums[l], -1);
            l++;
        }
        res = max(res, r - l + 1);
    }
    return res;
  }
  void bin(List<int> arr, int n, int op){
    for (int i = 0; i < 30; i++){
        if (n & (1 << i) > 0) arr[i] += 1 * op;
    }
  }
}