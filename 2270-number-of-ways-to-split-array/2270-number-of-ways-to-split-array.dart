class Solution {
  int waysToSplitArray(List<int> nums) {
    final sum = nums.reduce((a, b) => a + b);
    int res = 0, cur = 0;
    for (int i = 0; i < nums.length - 1; i++){
        cur += nums[i];
        if (cur * 2 >= sum){
            res++;
        }
    }
    return res;
  }
}