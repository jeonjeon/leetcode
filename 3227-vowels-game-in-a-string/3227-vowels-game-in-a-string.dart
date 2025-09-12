const vowels = {'a', 'e', 'i', 'o', 'u'};
class Solution {
  bool doesAliceWin(String s) =>
    s.split('').where((c) => vowels.contains(c)).length > 0;
}