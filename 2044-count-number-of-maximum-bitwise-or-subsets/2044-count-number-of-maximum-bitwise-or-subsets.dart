class Solution {
  int countMaxOrSubsets(List<int> nums) {
    int res = 0;
    final max = nums.reduce((a,b) => a | b);
    final len = pow(2, nums.length).toInt();
    for (int i = 1; i < len; i++){
      int cur = 0;
      for (int j = 0; j < nums.length; j++){
        int n = 1 << j;
        if (i & n == n){
          cur |= nums[j];
        }
      }
      if (cur == max) res++;
    }
    return res;
  }
}