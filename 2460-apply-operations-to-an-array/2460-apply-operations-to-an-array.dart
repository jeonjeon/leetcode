class Solution {
  List<int> applyOperations(List<int> nums) {
    final n = nums.length;
    int ri = 0;
    final res = List.filled(n, 0);
    for (int i = 0; i < nums.length; i++){
      if (i < n - 1 && nums[i] == nums[i + 1]){
        res[ri] = nums[i] * 2;
        nums[i + 1] = 0;
      } else {
        res[ri] = nums[i];
      }
      if (res[ri] > 0) ri++;
    }
    return res;
  }
}