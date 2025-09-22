class Solution {
  int maxFrequencyElements(List<int> nums) {
    final arr = List.filled(101, 0);
    nums.forEach((n) => arr[n]++);
    int res = 0, mx = 0;
    for (final f in arr){
      if (f > mx){
        res = f;
        mx = f;
        continue;
      }
      if (f == mx){
        res += mx;
      }
    }
    return res;
  }
}