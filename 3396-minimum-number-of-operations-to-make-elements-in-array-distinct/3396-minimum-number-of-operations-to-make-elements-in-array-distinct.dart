class Solution {
  int minimumOperations(List<int> nums) {
    final sett = <int>{};
    for (int i = nums.length - 1; i >= 0; i--){
        if (sett.contains(nums[i])){
            return ((i + 1) / 3).ceil();
        }
        sett.add(nums[i]);
    }
    return 0;
  }
}