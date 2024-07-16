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
  
  TreeNode? getLca(TreeNode? root, int sv, int dv) {
    if (root == null) return null;
    
    // Map to store parent of each node
    final parentMap = <int, TreeNode?>{};
    final queue = Queue<TreeNode>();
    queue.add(root);
    parentMap[root.val] = null;
    
    // BFS to traverse the tree and record parent nodes
    while (!queue.isEmpty && (parentMap[sv] == null || parentMap[dv] == null)) {
      final node = queue.removeFirst();
      
      if (node.left != null) {
        queue.add(node.left!);
        parentMap[node.left!.val] = node;
      }
      if (node.right != null) {
        queue.add(node.right!);
        parentMap[node.right!.val] = node;
      }
    }
    
    // Store ancestors of sv in a set
    final ancestors = Set<int>();
    var current = sv;
    while (parentMap[current] != null) {
      ancestors.add(current);
      current = parentMap[current]!.val;
    }
    ancestors.add(root.val);
    
    // Start from dv and find the first common ancestor
    current = dv;
    while (!ancestors.contains(current)) {
      current = parentMap[current]!.val;
    }
    
    // We've found the LCA, return the node
    return findNode(root, current);
  }

  // Helper function to find a node with a given value
  TreeNode? findNode(TreeNode? root, int value) {
    if (root == null) return null;
    final queue = Queue<TreeNode>();
    queue.add(root);
    
    while (!queue.isEmpty) {
      final node = queue.removeFirst();
      if (node.val == value) return node;
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
    
    return null;
  }
}