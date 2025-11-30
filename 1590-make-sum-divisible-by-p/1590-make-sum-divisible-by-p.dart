class Solution {
  int minSubarray(List<int> nums, int p) {
    final pre = <int>[0];
    nums.forEach((n) => pre.add((pre.last + n) % p));
    if (pre.last == 0) return 0;
    int l = 0, r = nums.length;
    while (l < r){
      final m = (l + r) ~/ 2;
      if (bs(pre, m, p)){
        r = m;
      } else {
        l = m + 1;
      }
    }
    if (l == nums.length) return -1;
    return l;
  }
  bool bs(List<int> pre, int m, int p){
    final target = pre.last;
    for (int i = m; i < pre.length; i++){
      var cur = pre[i] - pre[i - m];
      if (cur < 0) cur += p;
      if (cur == target) return true;
    }
    return false;
  }
}