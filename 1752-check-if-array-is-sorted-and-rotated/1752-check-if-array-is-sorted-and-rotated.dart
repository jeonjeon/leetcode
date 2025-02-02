class Solution {
  bool check(List<int> nums) {
    int cnt = 0;
    for (int i = 1; i < nums.length; i++){
        if (nums[i] < nums[i - 1]) cnt++;
    }
    if (cnt == 0) return true;
    if (cnt >= 2) return false;
    return nums.first >= nums.last;
  }
}