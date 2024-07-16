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
  String getDirections(TreeNode? root, int sv, int dv) {
    // Find the Lowest Common Ancestor (LCA)
    final lca = getLca(root!, sv, dv);
    
    // Construct the path: upward path (to LCA) + downward path (from LCA)
    return getPath(lca!, sv).replaceAll(RegExp(r'[^/]'), 'U') + getPath(lca!, dv);
  }
  
  // BFS to find path from root to target
  String getPath(TreeNode root, int target) {
    String res = '';
    final q = Queue<(TreeNode, String)>()..add((root, ''));
    while (q.isNotEmpty) {
      final (node, path) = q.removeFirst();
      if (node.val == target) return path;
      if (node.left != null) {
        q.add((node.left!, path + 'L'));
      }
      if (node.right != null) {
        q.add((node.right!, path + 'R'));
      }
    }
    return '';
  }
  
  // Find Lowest Common Ancestor
  TreeNode? getLca(TreeNode? root, int sv, int dv) {
    if (root == null) return null;
    if (root.val == sv || root.val == dv) {
      return root;
    }
    final left = getLca(root.left, sv, dv);
    final right = getLca(root.right, sv, dv);
    if (left != null && right != null) {
      return root;
    }
    if (left != null) {
      root.right = null;
      return left;
    } 
    if (right != null) {
      root.left = null;
      return right;
    }
    // Optimize by pruning unnecessary branches
    root.left = null;
    root.right = null;
    return null;
  }
}