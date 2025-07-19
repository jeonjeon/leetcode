class Solution {
  List<String> removeSubfolders(List<String> folder) {
    folder.sort();
    final res = <String>[];
    final trie = Trie();
    for (final f in folder){
      final fArr = f.split('/').skip(1).toList();
      if (trie.add(fArr)) res.add(f);
    }
    return res;
  }
}
class Trie {
  final children = <String, Trie>{};
  bool done = false;

  bool add(List<String> word){
    var cur = this;
    for (int i = 0; i < word.length; i++){
      cur = (cur.children[word[i]] ??= Trie());
      if (cur.done) return false;
    }
    cur.done = true;
    return true;
  }
}