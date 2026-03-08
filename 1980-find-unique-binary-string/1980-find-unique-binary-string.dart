class Solution {
  String findDifferentBinaryString(List<String> nums) {
    final len = nums[0].length;
    final sett = nums.map((n) => int.parse(n, radix: 2)).toSet();
    for (int n = 0; n < 1 << len; n++){
      if (sett.contains(n)) continue;
      return n.toRadixString(2).padLeft(len, '0');
    }
    return '';
  }
}