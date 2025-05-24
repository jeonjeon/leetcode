class Solution {
  List<int> findWordsContaining(List<String> words, String x) {
    final res = <int>[];
    for(int i = 0; i < words.length; i++){
        if (words[i].split('').any((w) => w == x)) res.add(i);
    }
    return res;
  }
}