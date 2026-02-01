class Solution {
  int minimumCost(List<int> nums) {
    final first = nums.first;
    final arr = nums.skip(1).toList()..sort();
    return first + arr.take(2).reduce((a, b) => a + b);
  }
}