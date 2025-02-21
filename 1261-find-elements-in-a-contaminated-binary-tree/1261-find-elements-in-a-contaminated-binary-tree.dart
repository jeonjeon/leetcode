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
class FindElements {
    final sett = <int>{};
  FindElements(TreeNode? root) {
     root!.val = 0;
     final q = Queue<TreeNode>();
     q.add(root!);
     while(q.isNotEmpty){
        final cur = q.removeFirst();
        sett.add(cur.val);
        if (cur.left != null){
            cur.left!.val = cur.val * 2 + 1;
            q.add(cur.left!);
        }
        if (cur.right != null){
            cur.right!.val = cur.val * 2 + 2;
            q.add(cur.right!);
        }
     }
  }
  
  bool find(int target) => sett.contains(target);
}

/**
 * Your FindElements object will be instantiated and called as such:
 * FindElements obj = FindElements(root);
 * bool param1 = obj.find(target);
 */