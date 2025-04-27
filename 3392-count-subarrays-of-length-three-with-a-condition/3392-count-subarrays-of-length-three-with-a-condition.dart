class Solution {
  int countSubarrays(List<int> nums) {
    int res = 0;
    for (int i = 1; i < nums.length - 1; i++){
      if ((nums[i - 1] + nums[i + 1]) * 2 == nums[i]){
        res++;    
      } 
    }
    return res;
  }
}