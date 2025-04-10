class Solution {
  int numberOfPowerfulInt(int start, int finish, int limit, String s) {
    int count(int val) {
      String chakra = val.toString();
      int n = chakra.length - s.length;

      if (n < 0) return 0;

      // Initialize dp array with size (n+1) x 2
      List<List<int>> dp = List.generate(n + 1, (_) => List.filled(2, 0));

      // Base case
      dp[n][0] = 1;
      dp[n][1] = int.parse(chakra.substring(n)) >= int.parse(s) ? 1 : 0;

      // Fill DP table from back to front
      for (int i = n - 1; i >= 0; i--) {
        int digit = int.parse(chakra[i]);

        // Not tight → any digit from 0 to limit
        dp[i][0] = (limit + 1) * dp[i + 1][0];

        // Tight case → we must respect current digit
        if (digit <= limit) {
          dp[i][1] = digit * dp[i + 1][0] + dp[i + 1][1];
        } else {
          dp[i][1] = (limit + 1) * dp[i + 1][0];
        }
      }

      return dp[0][1];
    }

    return count(finish) - count(start - 1);
  }
}