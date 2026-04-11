import 'dart:math';
class Solution {
  int minimumDistance(List<int> nums) {
    int n = nums.length;
    int dist = n;
    final hm = <int,List<int>>{};
    for (int i = 0; i < n; i++){
      (hm[nums[i]] ??= []).add(i);
      final arr = hm[nums[i]]!;
      if (arr.length < 3) continue;
      dist = min(dist, arr.last - arr[arr.length -3]);
    }
    if (dist == n) return -1;
    return dist * 2;
  }
}