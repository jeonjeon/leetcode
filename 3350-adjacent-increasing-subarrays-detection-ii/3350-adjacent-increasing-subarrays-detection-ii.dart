class Solution {
  int maxIncreasingSubarrays(List<int> nums) {
    final prefix = List.filled(nums.length, 1);
    for (int i = 1; i < nums.length; i++){
        if (nums[i] > nums[i - 1]){
            prefix[i] += prefix[i - 1];
        }
    }
    int l = 1, r = nums.length ~/ 2;
    while (l < r){
        final k = ((l + r) / 2).ceil();
        // print('l: $l, r: $r');
        if (bs(prefix, k)){
            l = k;
        } else {
            r = k - 1;
        }
    }
    return r;
  }
  bool bs(List<int> prefix, int k){
    for (int i = k - 1; i < prefix.length - k; i++){
        if (prefix[i] >= k && prefix[i + k] >= k) return true;
    }
    return false;
  }
}