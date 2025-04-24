class Solution {
  int countCompleteSubarrays(List<int> nums) {
    final dist = nums.toSet().length;
    final cnt = <int, int>{};
    int l = 0, res = 0;
    for (int r = 0; r < nums.length; r++){
      cnt[nums[r]] = (cnt[nums[r]] ?? 0) + 1;
      while (l < r && cnt.length == dist && cnt[nums[l]]! != 1){
        cnt[nums[l]] = cnt[nums[l++]]! - 1;
        if (cnt[nums[l]]! == 0) cnt.remove(nums[l]);
      }
      if (cnt.length == dist) {
        res += l + 1;
      }
    }
    return res;
  }
}