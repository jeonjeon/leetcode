class Solution {
  int findTheWinner(int n, int k) {
    final root = Node(1);
    var cur = root;
    for (int i = 2; i <= n; i++){
      cur!.next = Node(i);
      cur = cur!.next!;
    }
    cur!.next = root;
    int cnt = 1;
    while (cur!.next!.val != cur!.val){
      if (cnt == k){
        cur!.next = cur!.next!.next; 
        cnt = 1;
      } else{
        cur = cur!.next!;
        cnt++;
      }
    }
    return cur!.val;
  }
}
class Node {
  Node(this.val);
  final int val;
  Node? next;
}