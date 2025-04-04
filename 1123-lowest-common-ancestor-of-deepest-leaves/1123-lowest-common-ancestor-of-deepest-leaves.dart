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
  TreeNode? res;
  TreeNode? lcaDeepestLeaves(TreeNode? root) {
    var q = Queue<TreeNode>();
    var bottom = <int>{};
    q.add(root!);
    while (q.isNotEmpty){
        final curLV = <int>{};
        var temp = Queue<TreeNode>();
        while (q.isNotEmpty){
            final cur = q.removeFirst();
            curLV.add(cur.val);
            if (cur.left != null){
                temp.add(cur.left!);
            }
            if (cur.right != null){
                temp.add(cur.right!);
            }
        }
        bottom = curLV;
        q = temp;
    }
    dfs(root!, bottom);
    return res!;
  }
  int dfs(TreeNode root, Set<int> bottom){
    int cnt = 0; 
    if (bottom.contains(root.val)) cnt++;
    if (root.left != null){
        cnt += dfs(root.left!, bottom);
    }
    if (root.right != null){
        cnt += dfs(root.right!, bottom);
    }
    if (cnt == bottom.length){
        res = root;
        return 0;
    }
    return cnt;
  }
}