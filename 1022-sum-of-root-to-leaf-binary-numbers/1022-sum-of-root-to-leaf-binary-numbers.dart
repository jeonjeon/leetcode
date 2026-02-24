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
  int sumRootToLeaf(TreeNode? root) {
    final q = Queue<(int, TreeNode)>()..add((0, root!));
    int res = 0;
    while (q.isNotEmpty){
      final (prev, node) = q.removeFirst();
      final cur = (prev << 1) + node.val;
      if (node.left == null && node.right == null){
        res += cur;
        continue;
      }
      if (node.left != null) q.add((cur, node.left!));
      if (node.right != null) q.add((cur, node.right!));
    }
    return res;
  }
}