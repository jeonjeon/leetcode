class Solution {
  int countValidSelections(List<int> nums) {
    final total = nums.reduce((a, b) => a + b);
    int leftSum = 0, res = 0;
    for (final n in nums){
      if (n > 0){
        leftSum += n;
        continue;
      }
      final diff = (leftSum * 2 - total).abs();
      res += switch (diff){
        0 => 2,
        < 2 => 1,
        _ => 0,
      };
    }
    return res;
  }
}