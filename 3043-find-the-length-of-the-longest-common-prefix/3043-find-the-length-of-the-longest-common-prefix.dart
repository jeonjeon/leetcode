import 'dart:math';
class Solution {
  int longestCommonPrefix(List<int> arr1, List<int> arr2) {
    final root = Trie();
    int res = 0;
    for (final a in arr1){
      root.insert('$a');
    }
    for (final a in arr2){
      res = max(res, root.getLen('$a'));
      // print('a: $a, res: $res');
    }
    return res;
  }
}

class Trie {
  final children = <String, Trie>{};
  void insert(String word){
    var node = this;
    for (int i = 0; i < word.length; i++){
      final c = word[i];
      node = (node.children[c] ??= Trie());
    }
  }
  int getLen(String word){
    Trie? node = this;
    for (int i = 0; i < word.length; i++){
      node = node?.children[word[i]];
      // print('i: $i, node: ${node.children}');
      if (node == null){
        return i;
      }
    }
    return word.length;
  }
}