class Solution {
  List<int> vowelStrings(List<String> words, List<List<int>> queries) {
    final res = <int>[];
    final vowels = {'a', 'e', 'i', 'o', 'u'};
    final prefix = List.filled(words.length + 1, 0);
    for (int i = 0; i < words.length; i++){
      prefix[i + 1] += prefix[i];
      if (vowels.contains(words[i][0]) && vowels.contains(words[i][words[i].length - 1])){
          prefix[i + 1]++;
      }
    }
    for (final q in queries){
        res.add(prefix[q[1] + 1] - prefix[q[0]]);
    }
    return res;
  }
}