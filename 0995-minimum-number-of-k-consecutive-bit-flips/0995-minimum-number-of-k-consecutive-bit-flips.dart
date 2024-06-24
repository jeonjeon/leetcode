class Solution {
  int minKBitFlips(List<int> nums, int k) {
    int res = 0;
    int cur = 0; // 이전 flip의 영향을 받는지 여부
    for (int i = 0; i < nums.length; i++){
      if (i >= k && nums[i - k] == 1){
        cur ^= 1;
      }
      if (nums[i] ^ cur == 0){
        if (i + k > nums.length){
          return -1;
        }
        res++;
        cur ^= 1;
        nums[i] = 1;
      } else {
        nums[i] = 0;
      }
    }
    return res;
  }
}