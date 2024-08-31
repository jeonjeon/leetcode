import heapq
import collections
class Solution:
    def maxProbability(self, n: int, edges: List[List[int]], succProb: List[float], start_node: int, end_node: int) -> float:
      hm = defaultdict(list)
      dist = [0] * n
      heap = []
      for i in range(len(edges)):
        e = edges[i]
        sp = succProb[i]
        hm[e[0]].append((e[1], sp))
        hm[e[1]].append((e[0], sp))
      heapq.heappush(heap, (-1.0, start_node))
      while heap:
        prob, node = heapq.heappop(heap)
        prob = -prob
        if dist[node] >= prob:
          continue
        dist[node] = prob
        for nextIdx, nextProb in hm[node]:
          if dist[nextIdx] < prob * nextProb:
            heapq.heappush(heap, (-prob * nextProb, nextIdx))
      return dist[end_node] 
