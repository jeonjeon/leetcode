# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

#class Solution {
#  ListNode? head;
#  ListNode? mergeNodes(ListNode? head) {
#    if (head == null) return null;
#    this.head ??= head;
#    final next = mergeNodes(head!.next);
#    if (identical(this.head, head)){
#      return next;
#    }
#    if (head!.val == 0){
#      return ListNode(0, next);
#    }
#    next?.val = (next?.val ?? 0) + head!.val;
#    return next;
#  }
#}
defmodule Solution do
  @spec merge_nodes(head :: ListNode.t | nil) :: ListNode.t | nil
  def merge_nodes(head) do
    head
    |> merge(0)
    |> (fn %ListNode{val: _, next: next} -> next end).()
  end

  # 마지막
  defp merge(%ListNode{val: 0, next: nil}, acc) do
    %ListNode{val: acc, next: nil}
  end

  # 중간 0
  defp merge(%ListNode{val: 0, next: next}, acc) do
    %ListNode{val: acc, next: merge(next, 0)}
  end
  
  # 정상
  defp merge(%ListNode{val: cur, next: next}, acc) do
    merge(next, acc + cur)
  end
end