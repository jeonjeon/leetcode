/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
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
  bool isSubPath(ListNode? head, TreeNode? root) {
    final arr = <int>[];
    while(head != null){
      arr.add(head!.val);
      head = head!.next;
    }
    var q = Queue<(TreeNode, Queue<int>)>();
    q.add((root!, Queue<int>()));
    while (q.isNotEmpty){
      var (cur, curQ) = q.removeFirst();
      final nextQ = Queue<int>.from(curQ)..add(cur.val);
      while (nextQ.length > arr.length){
        nextQ.removeFirst();
      }
      int i = 0;
      for (final v in nextQ){
        if (v != arr[i]) break;
        i++;
      }
      if (i == arr.length) return true;
      if (cur.left != null) q.add((cur.left!, nextQ));
      if (cur.right != null) q.add((cur.right!, nextQ));
    }
    return false;
  }
}