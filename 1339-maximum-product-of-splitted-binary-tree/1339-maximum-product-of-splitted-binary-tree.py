class Solution:
    def maxProduct(self, root: Optional[TreeNode]) -> int:
        MOD = 1000000007
        self.res = 0
        self.s = 0
        
        self.s = self.check(root)
        self.check(root)
        return self.res % MOD
    
    def check(self, root: Optional[TreeNode]) -> int:
        if root is None:
            return 0
        cur = root.val + self.check(root.left) + self.check(root.right)
        self.res = max(self.res, (self.s - cur) * cur)
        return cur