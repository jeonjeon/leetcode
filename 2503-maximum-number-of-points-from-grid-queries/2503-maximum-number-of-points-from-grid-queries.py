class Solution:
    def maxPoints(self, grid: List[List[int]], queries: List[int]) -> List[int]:
        heap = [(grid[0][0],0,0)]
        dp = [0] * 1000001
        res = []
        while heap:
            curr, y, x = heapq.heappop(heap)
            if grid[y][x] == 0: continue
            dp[curr] += 1
            grid[y][x] = 0
            # print(grid, y, x)
            for dy, dx in [[-1, 0], [1, 0], [0, -1], [0, 1]]:
                nY = y + dy
                nX = x + dx
                if 0 <= nY < len(grid) and 0 <= nX < len(grid[0]):
                    if grid[nY][nX] == 0: continue
                    heapq.heappush(heap, (max(grid[nY][nX], curr), nY, nX))
        for i in range(1, 1000001):
            dp[i] += dp[i - 1]
        for q in queries:
            res.append(dp[q - 1])
        return res