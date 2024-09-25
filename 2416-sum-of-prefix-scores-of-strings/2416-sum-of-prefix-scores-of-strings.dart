class Solution {
  List<int> sumPrefixScores(List<String> words) {
    final res = <int>[];
    final root = Trie();
    for (final word in words){
      root.insert(word);
    }
    for (final word in words){
      res.add(root.getCnt(word));
    }
    return res;
  }
}
class Trie {
  final children = <String, Trie>{};
  int cnt = 0;
  void insert (String word){
    var node = this;
    for (int i = 0; i < word.length; i++){
      final c = word[i];
      node = (node.children[c] ??= Trie());
      node.cnt++;
    }
  }
  int getCnt(String word){
    var node = this;
    int res = 0;
    for (int i = 0; i < word.length; i++){
      final c = word[i];
      node = node.children[c]!;
      res += node.cnt;
    }
    return res;
  }
}