import 'dart:math';
class Solution {
  int minOperations(List<int> nums, int k) 
    => nums.reduce((a, b) => a + b) % k;
  
}