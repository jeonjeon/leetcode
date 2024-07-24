class Solution:
    def sortJumbled(self, mapping: List[int], nums: List[int]) -> List[int]:
               # Get tuples (number in nums, mappedNumber)
        records = [(n, self.getMappedValue(mapping, n)) for n in nums]
        # Sort tuples by mappedNumber
        records.sort(key=lambda x: x[1])
        # Map tuples (number in nums, mappedNumber) to number in nums
        return [r[0] for r in records]

    def getMappedValue(self, mapping, n):
        if n == 0:
            return mapping[0]
        res = 0
        top = 1
        while n >= top * 10:
            top *= 10
        while top > 0:
            div = n // top
            res += mapping[div] * top
            n -= div * top
            top //= 10
        return res 