/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
import 'dart:collection';
class Solution {
  TreeNode? createBinaryTree(List<List<int>> descriptions) {
    final children = <int>{};
    final edges = <int, List<(int, int)>>{};
    for (final desc in descriptions){
      children.add(desc[1]);
      edges[desc[0]] ??= [];
      edges[desc[0]]!.add((desc[1], desc[2]));
    }
    final rootVal = edges.keys.firstWhere((k) => !children.contains(k));
    final root = TreeNode(rootVal);
    final q = Queue<TreeNode>()..add(root);
    while (q.isNotEmpty){
      final cur = q.removeFirst();
      final next = edges[cur.val] ?? [];
      for (final (n, left) in next){
        if (left == 1){
          cur.left = TreeNode(n);
          q.add(cur.left!);
        } else {
          cur.right = TreeNode(n);
          q.add(cur.right!);
        }
      }
    }
    return root;
  }
}