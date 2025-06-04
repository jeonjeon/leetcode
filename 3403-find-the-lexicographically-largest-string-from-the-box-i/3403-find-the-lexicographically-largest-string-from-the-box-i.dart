import 'dart:math';
class Solution {
  String answerString(String word , int nf) {
    if (nf == 1) return word;
    final len = word.length - nf + 1;
    String res = '';
    for (int i = 0; i < word.length; i++){
      final curr = word.substring(i, min(i + len, word.length));
      if (curr.compareTo(res) > 0) res = curr;
    }
    return res;
  }
}