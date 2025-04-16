class Solution {
  int countGood(List<int> nums, int k) {
    int l = 0, pairs = 0, res = 0;
    final hm = <int, int>{};
    for (int r = 0; r < nums.length; r++){
      hm[nums[r]] = (hm[nums[r]] ?? 0) + 1;
      pairs += hm[nums[r]]! - 1;
      while (l < nums.length && pairs >= k && pairs - hm[nums[l]]! + 1 >= k){
        pairs -= hm[nums[l]]! - 1;
        hm[nums[l]] = hm[nums[l]]! - 1;
        l++;
      }
      if (pairs >= k) res += l + 1;
    }
    return res;
  }
}