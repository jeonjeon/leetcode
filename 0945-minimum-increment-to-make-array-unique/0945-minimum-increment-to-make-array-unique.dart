class Solution {
  int minIncrementForUnique(List<int> nums) {
    nums.sort();
    int prev = 0;
    int res = 0;
    for (final n in nums){
      //가능
      if (prev < n){
        prev = n + 1;
        continue;
      }
      res += prev - n;
      prev++;
    }
    return res;
  }
}