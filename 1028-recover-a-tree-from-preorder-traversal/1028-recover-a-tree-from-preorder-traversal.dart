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
  TreeNode? recoverFromPreorder(String t) {
    final (root, _) = dfs(0, t, 0);
    return root;
  }
  
  (TreeNode?, int) dfs(int depth, String t, int l){
    // print('depth: $depth, t: $t, l: $l');
    if (l >= t.length) return (null, l);
    final (d, val, cl) = getLv(t, l);
    if (d != depth) return (null, l);
    final cur = TreeNode(val);
    final (left, ll) = dfs(depth + 1, t, cl);
    if (ll > cl) cur.left = left;
    final (right, rl) = dfs(depth + 1, t, ll);
    if (rl > ll) cur.right = right;
    return (cur, rl);
  }

  // depth, val, next index
  (int, int, int) getLv(String t, int i){
    int d = 0;
    while (i < t.length && t[i] == '-'){
        d++;
        i++;
    }
    int val = 0;
    while (i < t.length && t[i] != '-'){
        val *= 10;
        val += int.parse(t[i]);
        i++;
    }
    return (d, val, i);
  }
}