class Solution {
  int specialArray(List<int> nums) {
    final candi = List.filled(1001, 0);
    nums.forEach((n) => candi[n]++);
    for (int i = 999; i >= 0; i--){
      candi[i] += candi[i + 1];
      if (candi[i] == i) return i;
    }
    return -1;
  }
}