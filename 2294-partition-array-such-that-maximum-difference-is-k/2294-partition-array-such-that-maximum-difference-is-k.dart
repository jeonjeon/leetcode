class Solution {
  int partitionArray(List<int> nums, int k) {
    nums.sort();
    int res = 1, first = nums.first;
    for (int i = 1; i < nums.length; i++){
        if (first + k >= nums[i]) continue;
        first = nums[i];
        res++;
    }
    return res;
  }
}