import 'dart:math';
class Solution {
  final a = 'a'.codeUnitAt(0);
  int maxScoreWords(List<String> words, List<String> letters, List<int> scores) {
    final l = List.filled(26, 0);
    for (final letter in letters){
      l[letter.codeUnitAt(0) - a]++;
    }
    return dfs(words, l, scores, 0, 0);
  }
  int dfs(List<String> words, List<int> letters, List<int> scores, int idx, int curScore){
    if (idx == words.length){
      return curScore;
    }
    int res = 0;
    final remAndScore = getRemAndScore(words[idx], letters, scores);
    // print('idx: $idx, remAndScore: $remAndScore');
    if (remAndScore != null){
      res = max(res, dfs(words, remAndScore.$1, scores, idx + 1, curScore + remAndScore.$2));
    }
    res = max(res, dfs(words, letters, scores, idx + 1, curScore));
    return res;
  }
  (List<int>, int)? getRemAndScore(String word, List<int> letters, List<int> scores){
    final rem = List<int>.from(letters);
    var score = 0;
    for (int i = 0; i < word.length; i++){
      final cur = word.codeUnitAt(i) - a;
      rem[cur]--;
      score += scores[cur];
      if (rem[cur] < 0){
        return null;
      }
    }
    return (rem, score);
  }
}