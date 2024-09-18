class Solution {
  String largestNumber(List<int> nums) {
    final arr = nums.map((n) => '$n').toList()..sort((a, b) {
      final ab = '$a$b';
      final ba = '$b$a';
      return ba.compareTo(ab);
    });
    final res = arr.skipWhile((r) => r == '0').join('');
    if (res.isEmpty) return '0';
    return res;
  }
}