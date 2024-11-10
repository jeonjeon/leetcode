class Solution {
  int minimumSubarrayLength(List<int> nums, int k) {
    if (nums.any((n) => n >= k)) return 1;
    if (nums.reduce((a, b) => a | b) < k) return -1;
    // print('k: ${k.toRadixString(2)}');
    int l = 1, r = nums.length;
    while (l < r){
        final len = (l + r) ~/ 2;
        // print('len: $len');
        if (or(nums, len, k)){
            // print(true);
            r = len;
        } else {
            // print(false);
            l = len + 1;
        }
    }
    return r;
  }
  int bitsToInt(List<int> bits) {
    int res = 0;
    for (int i = 0; i < bits.length; i++){
        if (bits[i] > 0){
            res += 1 << i;
        }
    }
    return res;
  }
  bool or(List<int> nums, int len, int k){
    final bits = List.filled(30, 0);
    for (int i = 0; i < len; i++){
        int n = nums[i];
        for (int j = 0; j < bits.length; j++){
            if (n & (1 << j) > 0){
                bits[j]++;
            }
        }
    }
    // print('bits: $bits, int: ${bitsToInt(bits)}');
    if (bitsToInt(bits) >= k){
        return true;
    }
    for (int i = len; i < nums.length; i++){
        int n = nums[i - len];
        for (int j = 0; j < bits.length; j++){
            if (n & (1 << j) > 0) bits[j]--;
        }
        n = nums[i];
        for (int j = 0; j < bits.length; j++){
            if (n & (1 << j) > 0) bits[j]++;
        }
        // print('bits: $bits, int: ${bitsToInt(bits)}');
        if (bitsToInt(bits) >= k){
            return true;
        }
    }
    return false;
  }
}