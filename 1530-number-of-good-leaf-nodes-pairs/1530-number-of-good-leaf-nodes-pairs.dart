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
  int res = 0;

  List<int> dfs(TreeNode? node, int distance) {
    List<int> map = List<int>.filled(11, 0); // Initialize list with 11 elements filled with 0s

    if (node == null) return map;

    if (node.left == null && node.right == null) {
      map[1] = 1;
      return map;
    }

    List<int> left = dfs(node!.left, distance); // Use node! to assert non-null
    List<int> right = dfs(node.right, distance); // node.right is already non-null

    for (int i = 1; i <= distance; i++) {
      for (int j = 1; j <= distance; j++) {
        if (i + j <= distance) {
          res += left[i] * right[j];
        }
      }
    }

    for (int i = 2; i < 11; i++) {
      map[i] += left[i - 1] + right[i - 1];
    }

    return map;
  }

  int countPairs(TreeNode? root, int distance) {
    if (root == null) return 0;
    dfs(root, distance);
    return res;
  }
}