class Solution {
  bool isArraySpecial(List<int> nums) {
    for (int i = 1; i < nums.length; i++){
        if ((nums[i] + nums[i - 1]) % 2 == 0) return false;
    }
    return true;
  }
}