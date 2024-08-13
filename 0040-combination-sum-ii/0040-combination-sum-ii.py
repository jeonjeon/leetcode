class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        result = []
        checkMap = {}
        uniqCandidates = []
        for i in candidates:
            if i in checkMap:
                checkMap[i] += 1
            else:
                checkMap[i] = 1
                uniqCandidates.append(i)
        
        def recursion(uniqCandidates, target, assemble):
            if target == 0:
                assemble.sort()
                assembleStr = ''.join(str(i) for i in assemble)
                result.append(assemble)
                return
            if target < 0:
                return
            while len(uniqCandidates) > 0:
                candidate = uniqCandidates.pop(0)
                cnt = checkMap[candidate]
                for i in range(1, cnt + 1):
                    recursion(list(uniqCandidates), target - candidate * i, assemble + [candidate] * i)
                    
        recursion(uniqCandidates, target, [])
        return result