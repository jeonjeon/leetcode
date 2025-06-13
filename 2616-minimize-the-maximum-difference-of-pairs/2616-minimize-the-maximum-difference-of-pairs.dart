class Solution {
  int minimizeMax(List<int> nums, int p) {
    if (p == 0) return 0;
    nums.sort();
    int l = 0, r = nums.last;
    while (l < r){
        final m = (l + r) ~/ 2;
        if (bs(nums, p, m)){
            r = m;
        } else {
            l = m + 1;
        }
    }
    return l;
  }
  bool bs(List<int> nums, int p, int m){
    for (int i = 1; i < nums.length; i++){
        final diff = (nums[i] - nums[i - 1]).abs();
        if (diff > m) continue;
        p--;
        i++;
        if (p == 0) return true;
    }
    return false;
  }
}
