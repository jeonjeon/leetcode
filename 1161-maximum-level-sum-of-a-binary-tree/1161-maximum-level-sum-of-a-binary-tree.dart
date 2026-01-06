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
  int maxLevelSum(TreeNode? root) {
    int mn = -1000000000, res = 1, lv = 1;
    var q = Queue<TreeNode>()..add(root!);
    while (q.isNotEmpty){
      final temp = Queue<TreeNode>();
      int sum = 0;
      while (q.isNotEmpty){
        final cur = q.removeFirst();
        sum += cur.val;
        if (cur.left != null) temp.add(cur.left!);
        if (cur.right != null) temp.add(cur.right!);
      }
      if (mn < sum){
        res = lv;
        mn = sum;
      }
      lv++;
      q = temp;
    }
    return res;
  }
}