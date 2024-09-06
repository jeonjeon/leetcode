/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? modifiedList(List<int> nums, ListNode? head) {
    final sett = nums.toSet();
    while (sett.contains(head?.val ?? 0)){
      head = head?.next;
    }
    var cur = head;
    while (cur != null){
      while (sett.contains(cur?.next?.val ?? 0)){
        cur!.next = cur!.next!.next;
      }
      cur = cur?.next;
    }
    return head;
  }
}