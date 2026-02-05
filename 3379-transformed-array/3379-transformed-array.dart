class Solution {
  List<int> constructTransformedArray(List<int> nums) 
    => List.generate(nums.length, (i) => nums[(i + nums[i] + nums.length) % nums.length]);
}