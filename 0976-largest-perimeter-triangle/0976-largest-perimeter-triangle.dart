class Solution {
  int largestPerimeter(List<int> nums) {
    nums.sort();
    for (int i = nums.length; i > 2; i--){
        final [a, b, c] = nums.sublist(i - 3, i);
        if (a + b > c) return a + b + c;
    }
    return 0;
  }
}