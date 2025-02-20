import 'dart:math';
class Solution {
  String findDifferentBinaryString(List<String> nums) {
    final bins = nums.map((n) => int.parse(n, radix: 2)).toSet();
    for (int i = 0; i < 65536; i++){
        if (!bins.contains(i)) return i.toRadixString(2).padLeft(nums.length, '0');
    }
    return '';
  }
}