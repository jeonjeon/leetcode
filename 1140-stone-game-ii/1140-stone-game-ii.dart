import 'dart:math';
class Solution {
  int stoneGameII(List<int> piles) {
    final n = piles.length;
    final dp = List.generate(n + 1, (i) => List.filled(n + 1, 0));
    int suffixSum = 0;
    for (int i = n - 1; i >= 0; i--){
      suffixSum += piles[i];
      // count the other's minimum score on each M
      for (int M = 1; M <= n; M++) {
        int minOther = suffixSum;
        for (int X = 1; X <= 2 * M && i + X <= n; X++) {
          minOther = min(minOther, dp[i + X][max(M, X)]);
        }
        // make the other's score to minimum => maximize my score
        dp[i][M] = suffixSum - minOther;
      }      
    }
    // when first turn with M = 1
    return dp.first[1];
  }
}