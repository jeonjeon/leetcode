class Solution {
  int countPairs(List<int> nums, int k) {
    int res = 0;
    for (int i = 0; i < nums.length; i++){
      for (int j = i + 1; j < nums.length; j++){
        if ((i * j) % k > 0) continue;
        if (nums[i] == nums[j]) res++;
      }
    }
    return res;
  }
}