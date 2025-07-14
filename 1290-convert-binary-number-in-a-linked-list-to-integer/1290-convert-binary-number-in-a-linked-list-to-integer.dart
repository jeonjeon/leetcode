/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int getDecimalValue(ListNode? head) {
    int res = 0;
    while (head != null){
        res <<= 1;
        res += head!.val;
        head = head!.next;
    }
    return res;
  }
}