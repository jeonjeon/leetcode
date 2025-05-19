class Solution {
  String triangleType(List<int> nums) {
    nums.sort();
    if (nums[0] + nums[1] <= nums[2]) return 'none';
    if (nums[0] == nums[1] && nums[1] == nums[2]) return 'equilateral';
    if (nums[0] == nums[1]) return 'isosceles';
    if (nums[1] == nums[2]) return 'isosceles';
    return 'scalene';
  }
}