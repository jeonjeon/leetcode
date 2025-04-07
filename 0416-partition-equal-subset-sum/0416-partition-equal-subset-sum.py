class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        numSum = sum(nums)
        if numSum % 2 != 0:
            return False
        resultSum = numSum // 2
        checkMap = {}
        def recursion(nums, resultSum) -> bool:
            if resultSum in checkMap:
                return checkMap[resultSum]
            while len(nums) > 0:
                num = nums.pop(0)
                if resultSum - num == 0:
                    return True
                if resultSum - num < 0:    
                    continue
                if recursion(list(nums), resultSum - num):
                    return True
            checkMap[resultSum] = False
            return False
        
        return recursion(nums, resultSum)