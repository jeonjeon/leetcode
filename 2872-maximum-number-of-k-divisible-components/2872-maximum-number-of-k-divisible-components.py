class Solution:
    def __init__(self):
        self.visit = {0}
    
    def maxKDivisibleComponents(self, n, edges, values, k):
        if n == 1:
            return 1
        
        hm = {}
        for e in edges:
            hm.setdefault(e[0], []).append(e[1])
            hm.setdefault(e[1], []).append(e[0])
        
        _, res = self.dfs(0, hm, values, k)
        return res

    def dfs(self, cur, hm, values, k):
        res = 0
        curVal = values[cur]
        nexts = hm.get(cur, [])
        
        for n in nexts:
            if n in self.visit:
                continue
            self.visit.add(n)
            nextVal, nextSum = self.dfs(n, hm, values, k)
            res += nextSum
            curVal += nextVal
        
        if curVal % k == 0:
            res += 1
        
        return curVal % k, res