import 'dart:math';
class Solution {
  int maxDotProduct(List<int> nums1, List<int> nums2) {
    final m = nums1.length, n = nums2.length;
    // if every elements in the nums1 is negative and every elements in
    final negCnt1 = nums1.where((n) => n < 0).length;
    final negCnt2 = nums2.where((n) => n < 0).length;
    final neg = negCnt1 == m && negCnt2 == 0 || negCnt1 == 0 && negCnt2 == n;
    final base = neg ? -1000000 : 0;
    final dp = List.generate(m,(_) => List.filled(n, 0));
    for (int i = 0; i < m; i++){
      dp[i][0] = max(base, nums1[i] * nums2[0]);
      if (i == 0) continue;
      dp[i][0] = max(dp[i][0], dp[i - 1][0]);
    }
    for (int j = 0; j < n; j++){
      dp[0][j] = max(base, nums1[0] * nums2[j]);
      if (j == 0) continue;
      dp[0][j] = max(dp[0][j], dp[0][j - 1]);
    }
    for (int i = 1; i < m; i++){
      for (int j = 1; j < n; j++){
        dp[i][j] = max(dp[i][j - 1], dp[i - 1][j]);
        final cur = nums1[i] * nums2[j];
        dp[i][j] = max(dp[i][j], dp[i - 1][j - 1] + (cur > 0 ? cur : 0));
      }
    }
    print(dp);
    return dp.last.last;
  }
}
