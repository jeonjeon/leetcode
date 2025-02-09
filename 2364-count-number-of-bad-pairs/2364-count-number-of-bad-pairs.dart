class Solution {
  int countBadPairs(List<int> nums) {
    final n = nums.length;
    final hm = <int, int>{};
    final total = n * (n - 1) ~/ 2;
    int goodPairs = 0;
    for (int i = 0; i < n; i++){
        final cur = nums[i] - i;
        goodPairs += hm[cur] ?? 0;
        hm[cur] = (hm[cur] ?? 0) + 1;
    }
    return total - goodPairs;
  }
}