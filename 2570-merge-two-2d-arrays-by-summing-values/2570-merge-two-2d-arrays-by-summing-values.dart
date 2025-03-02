class Solution {
  List<List<int>> mergeArrays(List<List<int>> nums1, List<List<int>> nums2) {
    final res = <List<int>>[];
    int i2 = 0, n1 = nums1.length, n2 = nums2.length;
    for (int i1 = 0; i1 < n1; i1++){
      while(i2 < n2 && nums2[i2][0] <= nums1[i1][0]){
        res.add(nums2[i2++]);
      }
      if (res.isNotEmpty && res.last[0] == nums1[i1][0]){
        res.last[1] += nums1[i1][1];
        continue;
      }
      res.add(nums1[i1]);
    }
    while (i2 < n2) res.add(nums2[i2++]);
    return res;
  }
}