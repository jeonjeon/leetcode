class Solution {
  int canBeTypedWords(String text, String broken) {
    final brk = broken.split('').toSet();
    return text.split(' ')
        .where((w) => w.split('').every((c) => !brk.contains(c)))
        .length;
  }
}