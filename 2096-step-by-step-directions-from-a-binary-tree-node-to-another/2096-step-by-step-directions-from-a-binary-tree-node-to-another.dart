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
    // 양방향 edges 만들기
    final lca = getLca(root!, sv, dv);
    return getPath(lca!, sv).replaceAll(RegExp(r'[^/]'), 'U') + getPath(lca!, dv);
  }
  String getPath(TreeNode root, int target){
    String res = '';
    final q = Queue<(TreeNode, String)>()..add((root, ''));
    while (q.isNotEmpty){
      final (node, path) = q.removeFirst();
      if (node.val == target) return path;
      if (node.left != null){
        q.add((node.left!, path + 'L'));
      }
      if (node.right != null){
        q.add((node.right!, path + 'R'));
      }
    }
    return '';
  }
  TreeNode? getLca(TreeNode? root, int sv, int dv){
    if (root == null) return null;
    if (root.val == sv || root.val == dv){
      return root;
    }
    final left = getLca(root.left, sv, dv);
    final right = getLca(root.right, sv, dv);
    if (left != null && right != null){
      return root;
    }
    if (left != null){
      root.right = null;
      return left;
    } 
    if (right != null){
      root.left = null;
      return right;
    }
    // 효율 쥐어짜기
    root.left = null;
    root.right = null;
    return null;
  }
}