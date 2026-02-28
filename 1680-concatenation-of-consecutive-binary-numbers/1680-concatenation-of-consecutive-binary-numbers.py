class Solution:
    def concatenatedBinary(self, n: int) -> int:
      mod = 1000000007
      res = 0
      for b in range(n):
        b += 1
        cur = b
        d = 0
        while cur > 0:
          d += 1
          cur >>= 1
        res <<= d
        res += b
        res %= mod
      return res