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
  TreeNode? reverseOddLevels(TreeNode? root) {
    var arr = <TreeNode>[root!];
    var lv = 0;
    while (arr.isNotEmpty){
        if (lv % 2 == 1){
            int l = 0, r = arr.length - 1;
            while (l < r){
                final temp = arr[l].val;
                arr[l].val = arr[r].val;
                arr[r].val = temp;
                l++;
                r--;
            }
        }
        final children = <TreeNode>[];
        for (final cur in arr){
            if (cur.left != null) children.add(cur.left!);
            if (cur.right != null) children.add(cur.right!);
        }
        lv++;
        arr = children;
    }
    return root;
  }
}