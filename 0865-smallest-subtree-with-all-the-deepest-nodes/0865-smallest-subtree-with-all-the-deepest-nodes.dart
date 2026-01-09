/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
import 'dart:math';
class Solution {
  TreeNode? subtreeWithAllDeepest(TreeNode? root) {
    final deepest = getDeepest(1, root);
    return getRes(deepest, 1, root);
  }
  int getDeepest(int deep, TreeNode? root){
    if (root == null) return deep - 1;
    return max(getDeepest(deep + 1, root!.left), getDeepest(deep + 1, root!.right));
  }
  TreeNode? getRes(int deepest, int deep, TreeNode? root){
    if (deep == deepest) return root;
    if (root == null) return null;
    final left = getRes(deepest, deep + 1, root!.left);
    final right = getRes(deepest, deep + 1, root!.right);
    if (left != null && right != null) return root;
    if (left != null) return left;
    if (right != null) return right;
    return null;
  }
}