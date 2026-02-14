class Solution:
    def champagneTower(self, poured: int, query_row: int, query_glass: int) -> float:
        dp = [[0 for i in range(100)] for j in range(100)]
        dp[0][0] = poured
        for i in range(99):
            for j in range(i + 1):
                overflow = dp[i][j] - 1
                if overflow <= 0:
                    continue
                dp[i + 1][j] += overflow / 2
                dp[i + 1][j + 1] += overflow / 2
        return min(dp[query_row][query_glass], 1)
                


            