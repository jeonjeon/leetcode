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
  final arr = <int>[];
  TreeNode? balanceBST(TreeNode? root) {
    dfs(root);
    return dfs2(arr);
  }
  void dfs(TreeNode? root){
    if (root == null){
      return;
    }
    dfs(root!.left);
    arr.add(root!.val);
    dfs(root!.right);
  }
  TreeNode? dfs2(List<int> list){
    if (list.isEmpty) return null;
    final mid = list.length ~/ 2;
    return TreeNode(list[mid], dfs2(list.sublist(0, mid)), dfs2(list.sublist(mid + 1)));
  }
}