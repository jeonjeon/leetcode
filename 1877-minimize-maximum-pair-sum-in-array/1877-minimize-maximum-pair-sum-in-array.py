class Solution:
    def minPairSum(self, nums: List[int]) -> int:
      l = len(nums)
      res = 0
      nums.sort()
      for i in range(l):
        res = max(res, nums[i] + nums[l - i - 1])
      return res
