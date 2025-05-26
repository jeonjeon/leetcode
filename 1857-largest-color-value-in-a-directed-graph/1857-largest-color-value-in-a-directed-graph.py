class Solution:
    def largestPathValue(self, colors: str, edges: List[List[int]]) -> int:
      if not edges: return 1
      a = ord('a')
      edg = {}
      indegree = [0 for _ in range(len(colors))]
      self.cycle = False
      for [s, e] in edges:
        if (s not in edg):
          edg[s] = []
        edg[s].append(e)
        indegree[e] += 1
      if 0 not in indegree:
        return -1
      # print(edg, indegree)
      memo = {}
      visit = set()
      def dfs(cur: int):
        if self.cycle: return 
        if cur in visit:
          self.cycle = True
          return []
        if cur in memo:
          return memo[cur]
        arr = [0 for i in range(26)]
        visit.add(cur)
        if cur in edg:
          for nxt in edg[cur]:
            nxtArr = dfs(nxt)
            if not nxtArr: break
            for i in range(26):
              arr[i] = max(arr[i], nxtArr[i])
        arr[ord(colors[cur]) - a] += 1
        # print(arr)
        visit.remove(cur)
        memo[cur] = arr
        return memo[cur]
      res = -1  
      for i in range(len(indegree)):
        if i not in edg: continue
        if indegree[i] == 0:
          res = max(res, max(dfs(i)))
      # print(self.cycle)
      # print(res)
      if self.cycle: return -1
      return res
