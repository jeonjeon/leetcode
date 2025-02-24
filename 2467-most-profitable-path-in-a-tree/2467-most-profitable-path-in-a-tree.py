class Solution:
    def mostProfitablePath(self, edges: List[List[int]], bob: int, amount: List[int]) -> int:
        # make edges to adjacency list
        edg = [[] for _ in range(len(edges) + 1)]
        for e in edges:
            edg[e[0]].append(e[1])
            edg[e[1]].append(e[0])
        
        dist = [inf] * len(edg)
        dist[bob] = 0
        visit = set()
        
        def dfs(cur, step):
            if cur == 0:
                return True
            if cur in visit:
                return False
            visit.add(cur)
            for n in edg[cur]:
                if n in visit:
                    continue
                if dfs(n, step + 1):
                    dist[n] = step + 1
                    return True
            return False
        
        dfs(bob, 0)
        res = -10**9 - 1
        q2 = deque([(0, 0, -1)])
        d = 0
        
        while q2:
            temp = deque()
            while q2:
                cur, score, prev = q2.popleft()
                if dist[cur] == d:
                    amount[cur] //= 2
                elif dist[cur] < d:
                    amount[cur] = 0
                score += amount[cur]
                
                if cur != 0 and len(edg[cur]) == 1:
                    res = max(res, score)
                    continue
                
                for n in edg[cur]:
                    if n == prev:
                        continue
                    temp.append((n, score, cur))
            
            q2 = temp
            d += 1
        
        return res
        