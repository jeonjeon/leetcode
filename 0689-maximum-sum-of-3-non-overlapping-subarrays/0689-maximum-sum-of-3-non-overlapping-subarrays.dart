class Solution {
  List<int> maxSumOfThreeSubarrays(List<int> nums, int k) {
     final prefix = [0];
     for (int i = 0; i < nums.length; i++) {
        prefix.add(nums[i] + prefix.last);
     }
     final dp = List.generate(3, (_) => List<(int, List<int>)>.generate(prefix.length, (_) => (0, [])));
     for (int i = 0; i < 3; i++){
        for (int j = k; j < prefix.length; j++){
            final (lastSum, lastIdxs) = dp[i][j - 1];
            final curIdx = j - k;
            final curSum = prefix[j] - prefix[j - k];
            if (i == 0){
                if (curSum > lastSum){
                    dp[i][j] = (curSum, [curIdx]);
                } else {
                    dp[i][j] = dp[i][j - 1];
                }
                continue;
            }
            final (prevSum, prevIdxs) = dp[i - 1][j - k];
            if (curSum + prevSum > lastSum){
                dp[i][j] = (curSum + prevSum, [...prevIdxs, curIdx]);
                continue;
            }
            dp[i][j] = dp[i][j - 1];
        }
     }
     return dp.last.last.$2;
  }
}