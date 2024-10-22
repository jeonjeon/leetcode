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
  int kthLargestLevelSum(TreeNode? root, int k) {
    final arr = List.filled(100000, 0);
    var q = Queue<TreeNode>()..add(root!);
    int level = 0;
    while (q.isNotEmpty){
      final temp = Queue<TreeNode>();
      while (q.isNotEmpty){
        final cur = q.removeFirst();
        arr[level] += cur.val;
        if (cur.left != null){
            temp.add(cur.left!);
        }
        if (cur.right != null){
            temp.add(cur.right!);
        }
      }
      q = temp;
      level++;
    }
    arr.sort((a, b) => b.compareTo(a));
    // print('arr: $arr, k: $k');
    return arr[k - 1] == 0 ? -1 : arr[k - 1];
  }
}