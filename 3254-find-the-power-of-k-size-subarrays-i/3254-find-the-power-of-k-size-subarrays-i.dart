class Solution {
  List<int> resultsArray(List<int> nums, int k) {
    if (k == 1) return nums;

    final res = <int>[];
    final n = nums.length;
    final prefix = List.filled(n, 1);
    
    for (int i = 1; i < n; i++){
         if (nums[i] - nums[i - 1] == 1){
            prefix[i] += prefix[i - 1];
         }

         if (i < k - 1) continue;

         if (prefix[i] >= k){
            res.add(nums[i]);
         } else {
            res.add(-1);
         }
    }
    return res;
  }
}