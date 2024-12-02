class Solution {
  int isPrefixOfWord(String s, String w) {
    final res = s.split(' ')
            .toList()
            .indexWhere((a) => a.startsWith(w)) + 1;
    if (res == 0) return -1;
    return res;
  }
}