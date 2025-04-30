import 'dart:math';
class Solution {
  int findNumbers(List<int> nums) =>
    nums.map((n) => '$n')
        .map((s) => s.length)
        .where((l) => l % 2 == 0)
        .length;
  
}