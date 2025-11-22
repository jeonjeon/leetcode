class Solution {
  int minimumOperations(List<int> nums) 
   => nums.map((n) => n % 3)
          .where((n) => n > 0)
          .length;
}