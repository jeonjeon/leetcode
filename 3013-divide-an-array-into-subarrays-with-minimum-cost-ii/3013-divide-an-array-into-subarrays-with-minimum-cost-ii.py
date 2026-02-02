from sortedcontainers import SortedList

class Solution:
    def minimumCost(self, nums: List[int], k: int, dist: int) -> int:
        first = nums[0]
        res = float('inf')
        total = 0
        k -= 1
        
        # heads: 최소값들을 저장 (내림차순으로 정렬하여 최대값이 first에 오도록)
        # rest: 나머지 값들을 저장 (오름차순)
        heads = SortedList(key=lambda x: -nums[x])
        rest = SortedList(key=lambda x: nums[x])
        
        l = 1
        for r in range(1, len(nums)):
            rest.add(r)
            
            # dist 범위 넘어갔으면
            if r - l > dist:
                if l in heads:
                    total -= nums[l]
                    heads.remove(l)
                else:
                    rest.remove(l)
                l += 1
            
            # 헤드 다 안 찼거나 더 작은 게 있으면
            if len(heads) < k or nums[rest[0]] < nums[heads[0]]:
                mn = rest[0]
                rest.pop(0)
                total += nums[mn]
                heads.add(mn)
            
            # 헤드 넘쳤으면
            if len(heads) > k:
                mx = heads[0]
                heads.pop(0)
                total -= nums[mx]
                rest.add(mx)
            
            # 기준 되면
            if len(heads) == k:
                res = min(res, total)
        
        return res + first