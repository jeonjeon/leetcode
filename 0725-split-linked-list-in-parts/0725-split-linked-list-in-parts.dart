/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  List<ListNode?> splitListToParts(ListNode? head, int k) {
    final res = List<ListNode?>.filled(k, null);
    var slow = head;
    var fast = head;
    for (int i = 0; i < res.length; i++){
      res[i] = slow;
      fast = slow;
      while (fast != null){
        // fast k 만큼 밀기
        for (int i = 0; i < k; i++){
          if (fast == null) break;
          fast = fast.next;
        }
        if (fast == null) break;
        // slow 1만큼 밀기
        slow = slow?.next;
      }
      // fast가 널이면 자름
      final next = slow?.next;
      slow?.next = null;
      slow = next;
      fast = slow;
      // 한개의 part 끝났으니 남은 parts 개수 줄여줌
      k--;
    }
    return res;
  }
}

