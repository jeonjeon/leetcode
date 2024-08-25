/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  final List<int> res = [];
  List<int> postorderTraversal(TreeNode? root) {
    dfs(root);
    return res;
  }
  void dfs(TreeNode? root){
    if (root == null) return;
    if (root.left != null){
      dfs(root.left);
    }
    if (root.right != null){
      dfs(root.right);
    }
    res.add(root.val);
  }
}