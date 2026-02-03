class Solution {
  bool isTrionic(List<int> nums) {
    if (nums[1] <= nums[0]) return false;
    int step = 1;
    for (int i = 2; i < nums.length; i++){
      if (nums[i] == nums[i - 1]) return false;
      // 짝수 (하락)
      if (step % 2 == 0 && nums[i] > nums[i - 1]){
        step++;
        continue;
      } 
      if (step % 2 == 1 && nums[i] < nums[i - 1]){
        step++;
      } 
    }
    return step == 3;
  }
}