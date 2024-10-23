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
  TreeNode? replaceValueInTree(TreeNode? root) {
    var q = Queue<(int, TreeNode)>()..add((root!.val, root!));
    while (q.isNotEmpty){
      final temp = Queue<(int, TreeNode)>();
      final arr = <TreeNode>[];
      int ssum = 0;
      while (q.isNotEmpty){
        final (p, child) = q.removeFirst();
        ssum += child.val;
        final nextP = (child.left?.val ?? 0) + (child.right?.val ?? 0);
        child.val = -p;
        arr.add(child);
        if (child.left != null){
            temp.add((nextP, child.left!));
        }
        if (child.right != null){
            temp.add((nextP, child.right!));
        }
      }
    //   print(ssum);
      for (final c in arr){
        c.val = c.val + ssum;
      }
      q = temp;
    }
    return root;
  }
}