class Solution {
  int findSmallestInteger(List<int> nums, int value) {
    final mod = List.filled(value, 0);
    for (int n in nums){
      mod[n % value]++;
    }
    for (int i = 0; i < nums.length; i++){
      final cur = i % value;
      if (mod[cur] == 0) return i;
      mod[cur]--;
    }
    return nums.length;
  }
}