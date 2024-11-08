class Solution {
  List<int> getMaximumXor(List<int> nums, int mb) {
    mb = (1 << mb) - 1;
    final res = <int>[];
    int xor = nums.reduce((a, b) => a ^ b);
    for (int i = nums.length - 1; i >= 0; i--){
        res.add(xor ^ mb);
        xor ^= nums[i];
    }
    return res;
  }
}