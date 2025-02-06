class Solution {
  int tupleSameProduct(List<int> nums) {
    final hm = <int, int>{};
    int maximum = 0;
    for (int i = 0; i < nums.length; i++){
        for (int j = i + 1; j < nums.length; j++){
            final prod = nums[i] * nums[j];
            hm[prod] = (hm[prod] ?? 0) + 1;
        }
    }
    return hm.values.where((v) => v > 1)
             .fold(0, (a, b) => a + 4 * (b * (b - 1)));
  }
}