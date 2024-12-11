class Solution {
  int maximumBeauty(List<int> nums, int k) {
    nums.sort();
    int l = 0, r = nums.length;
    while (l < r){
        final len = ((l + r) / 2).ceil();
        if (bs(nums, len, k)){
            // print('len: $len, true');
            l = len;
        } else {
            // print('len: $len, false');
            r = len - 1;
        }
    }
    return r;
  }
  bool bs(List<int> nums, int len, int k){
    int r = 0;
    for (int l = 0; l < nums.length; l++){
        while (r < nums.length && (nums[l] + k) >= (nums[r] - k)) r++;
        if (r - l >= len) return true;
    }
    return false;
  }
}