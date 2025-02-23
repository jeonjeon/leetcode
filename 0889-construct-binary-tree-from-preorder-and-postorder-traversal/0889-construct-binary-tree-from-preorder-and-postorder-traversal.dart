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
  TreeNode? constructFromPrePost(List<int> preorder, List<int> postorder) {
    int i = 0;
    final stack = <TreeNode>[];
    for (final post in postorder){
        while (stack.isEmpty || stack.last.val != post){
            stack.add(TreeNode(preorder[i]));
            i++;
        }
        final last = stack.removeLast();
        if (stack.isEmpty){
            return last;
        }
        if (stack.last.left == null){
            stack.last.left = last;
            continue;
        }
        stack.last.right = last;
    }
    return null;
  }
}