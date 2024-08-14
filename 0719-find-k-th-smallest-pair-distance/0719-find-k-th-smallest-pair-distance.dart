class Solution {
  int smallestDistancePair(List<int> nums, int k) {
    nums.sort();
    int l = 0, r = nums.last;
    while (l <= r){
      final m = ((l + r) / 2).ceil();
      if (lessCnt(nums, m) < k){
        l = m + 1;
      } else {
        r = m - 1;
      }
    }
    return l;
  }
  int lessCnt(List<int> nums, int m){
    int res = 0;
    int l = 0;
    for (int r = 1; r < nums.length; r++){
      while (nums[r] - nums[l] > m){
        l++;
      }
      if (l >= r) continue;
      res += r - l;
    }
    return res;
  }
}