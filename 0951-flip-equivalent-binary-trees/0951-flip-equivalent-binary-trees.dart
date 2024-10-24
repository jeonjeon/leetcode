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
  bool flipEquiv(TreeNode? root1, TreeNode? root2) {
    if (root1 == null && root2 == null) return true;
    if (root1 == null && root2 != null || root1 != null && root2 == null) return false;
    if (root1!.val != root2!.val) return false;
    if (root1!.left?.val == root2!.left?.val && root1!.right?.val == root2!.right?.val){
        return flipEquiv(root1!.left, root2!.left) && flipEquiv(root1!.right, root2!.right);
    }
    if (root1!.left?.val == root2!.right?.val && root1!.right?.val == root2!.left?.val){
        return flipEquiv(root1!.left, root2!.right) && flipEquiv(root1!.right, root2!.left);
    }
    // print('root1: ${root1!.val}, root2: ${root2!.val}');
    return false;
  }
}