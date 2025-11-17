class Solution {
  bool kLengthApart(List<int> nums, int k) {
    int last = -k - 1;
    for (int i = 0; i < nums.length; i++){
        if (nums[i] == 0) continue;
        if (i - last - 1 < k) return false;
        last = i;
    }
    return true;
  }
}