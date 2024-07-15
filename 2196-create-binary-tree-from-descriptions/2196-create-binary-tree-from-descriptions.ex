# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  @spec create_binary_tree(descriptions :: [[integer]]) :: TreeNode.t | nil
  def create_binary_tree(descriptions) do
    {children, edges} = descriptions
    |> Enum.reduce({MapSet.new(), %{}}, fn [p, c, left], {children, edges} ->
      edge = Map.get(edges, p, %{})
      {MapSet.put(children, c), Map.put(edges, p, Map.put(edge, left, c))}
    end)
    
    root = edges
    |> Map.drop(children)
    |> Map.keys()
    |> hd()

    helper(edges, root)
  end
  defp helper(edges, root) do
    case Map.get(edges, root) do
      %{1 => left, 0 => right} -> %TreeNode{val: root, left: helper(edges, left), right: helper(edges, right)}
      %{1 => left} -> %TreeNode{val: root, left: helper(edges, left)}
      %{0 => right} -> %TreeNode{val: root, right: helper(edges, right)}
      nil -> %TreeNode{val: root}
    end
  end
end