class Solution {
  List<int> plusOne(List<int> digits) {
    int plus = 1;
    for (int i = digits.length - 1; i >= 0; i--){
      digits[i] += plus;
      plus = digits[i] ~/ 10;
      digits[i] %= 10;
    }
    if (plus == 1) return [1, ...digits];
    return digits;
  }
}