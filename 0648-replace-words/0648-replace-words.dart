class Solution {
  String replaceWords(List<String> dictionary, String sentence) {
    final trie = Trie();
    var res = '';
    final sent = sentence.split(' ').toList();
    for (final dic in dictionary){
      trie.add(dic);
    }
    for (final s in sent){
      res += ' ${trie.get(s)}';
    }
    return res.trimLeft();
  }
}
class Trie {
  final root = Node();
  
  void add(String word){
    Node? node = root;
    for (int i = 0; i < word.length; i++){
      node!.children[word[i]] ??= Node();
      node = node.children[word[i]];
    }
    node!.word = word;
  }
  
  String get(String word){
    Node? node = root;
    for(int i = 0; i < word.length; i++){
      node = node?.children[word[i]];
      if(node == null){
        return word;
      }
      if(node?.word != null){
        return node!.word!;
      }
    }
    return word;
  }
}
class Node {
  final children = <String, Node>{};
  String? word;
}