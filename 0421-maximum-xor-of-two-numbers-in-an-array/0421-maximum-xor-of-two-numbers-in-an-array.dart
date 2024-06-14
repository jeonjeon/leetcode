import 'dart:math';
class Solution {
  int findMaximumXOR(List<int> nums) {
    final trie = Trie();
    nums.forEach(trie.insert);
    return nums.map((n) => trie.getXor(n) ^ n)
        .reduce(max);
  }
}
class Trie {
  final root = Node();
  void insert(int x){
    var node = root;
    int mask = 1 << 29;
    //print('x: $x, mask: $mask');
    while(mask > 0){
      final cur = (x & mask) > 0 ? 1 : 0;
      node.children[cur] ??= Node();
      node = node.children[cur]!;
      //print(node.children);
      mask >>= 1;
    }
    node.number = x;
  }
  
  int getXor(int x){
    var node = root;
    int mask = 1 << 29;
    while(mask > 0){
      final cur = (x & mask) > 0 ? 1 : 0;
      //print('x: $x, mask: $mask, cur: $cur, flipped: $flipped');
      if (node.children[cur ^ 1] != null){
        node = node.children[cur ^ 1]!;
      } else if(node.children[cur] != null){
        node = node.children[cur]!;
      } else {
        break;
      }
      mask >>= 1;
    }
    //print('x: $x, xor: ${node.number!}');
    return node.number!;
  }
  
}
class Node {
  final children = List<Node?>.filled(2, null);
  int? number;
}