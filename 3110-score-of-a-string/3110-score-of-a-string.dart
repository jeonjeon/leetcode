class Solution {
  int scoreOfString(String s) {
    return s.split('').fold((0, s[0]), (a, b) => (a.$1 + (a.$2.codeUnitAt(0) - b.codeUnitAt(0)).abs(), b)).$1;
  }
}