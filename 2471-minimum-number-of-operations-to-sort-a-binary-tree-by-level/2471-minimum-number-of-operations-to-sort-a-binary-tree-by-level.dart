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
  int minimumOperations(TreeNode? root) {
    int res = 0;
    var q = <TreeNode>[root!];
    while (q.isNotEmpty){
        final temp = <TreeNode>[];
        final stm = SplayTreeMap<int, int>();
        for (int i = 0; i < q.length; i++){
            final n = q[i];
            stm[n.val] = i;
            if (n.left != null){
                temp.add(n.left!);
            }
            if (n.right != null){
                temp.add(n.right!);
            }
        }
        int i = 0;
        for (final key in stm.keys){
            final idx = stm[key]!;
            if (q[i].val != key){
                // q swap
                final t = q[i].val;
                q[i].val = key;
                q[idx].val = t;
                // splayTreeMap swap
                stm[key] = i;
                stm[t] = idx;
                // counting result
                res++;
            }
            i++;
        }
        q = temp;
    }
    return res;
  }
}
