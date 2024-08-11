import 'dart:math';
class Solution {
  final mod = 1000000007;
  int countOfPairs(List<int> nums) {
    // rows: 현재 시점의 nums 엘레멘트
    // cols: 현재 시점에서 가능한 arr1의 엘레멘트
    final dp = List.generate(nums.length, (i) => List.filled(1001, 0));
    dp[0][0] = 1;
    for (int i = 1; i <= nums[0]; i++){
      dp[0][i] = dp[0][i - 1] + 1;
    }
    for (int i = 1; i < dp.length; i++){
      for (int j = 0; j <= nums[i]; j++){
        final arr1 = j; // arr1의 엘레멘트
        final arr2 = nums[i] - j; // arr2의 엘레멘트
        if (arr2 > nums[i - 1]) continue; // arr2의 엘레멘트가 직전 num보다 크면 가능한 경우의 수가 없음
        // 가능한 범위 조건: 
        // 1. prevArr1 <= arr1 (prevArr1 = prevArr1)
        // 2. prevArr2 >= arr2 (prevArr2 = nums[i - 1] - prevArr1)
        // 2번식을 괄호 안의 내용으로 전개하면 nums[i - 1] - prevArr1 >= arr2 
        // 다시 위의 식을 prevArr1에 대해 정리하면 prevArr1 <= nums[i - 1] - arr2
        final maximumCanCount = min(arr1, nums[i - 1] - arr2);
        dp[i][j] = (dp[i - 1][maximumCanCount] + (j > 0 ? dp[i][j - 1] : 0)) % mod;
      }
    }
    // last thing is the largest count
    int res = 0;
    for (final a in dp.last){
      if (a > 0) res = a;
    }
    return res;
  }
}