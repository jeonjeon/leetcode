# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def delNodes(self, root: Optional[TreeNode], to_delete: List[int]) -> List[TreeNode]:
      res = []
      delete = set(to_delete)
      def dfs(prev, node):
        # 널이면
        if not node: return
        # 제거 대상이면
        if node.val in delete:
          prev = None
          dfs(None, node.left)
          dfs(None, node.right)
          return
        # prev 없으면 해당 숲의 루트
        if not prev: res.append(node)
        # left가 제거대상이면
        if node.left: 
          left = node.left
          if node.left.val in delete:
            node.left = None
          dfs(node, left)
        if node.right: 
          right = node.right
          if node.right.val in delete:
            node.right = None
          dfs(node, right)
      dfs(None, root)
      return res
