class Solution:
    def numberOfSubarrays(self, nums: List[int], k: int) -> int:
      hm = {0:0}
      cnt = 0
      res = 0
      for i, n in enumerate(nums):
        if n % 2 == 1:
          cnt += 1
          hm[cnt] = i + 1
        if cnt >= k:
          res += hm[cnt - k + 1] - hm[cnt - k]
      return res