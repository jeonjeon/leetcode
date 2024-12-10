class Solution {
  List<bool> isArraySpecial(List<int> nums, List<List<int>> queries) {
    final len = nums.length;
    final prefix = List.filled(len, 0);
    final res = <bool>[];
    for (int i = 1; i < nums.length; i++){
        prefix[i] = prefix[i - 1];
        if (nums[i] % 2 == nums[i - 1] % 2){
            prefix[i]++;
        }
    }
    for (final q in queries){
        res.add(prefix[q[1]] - prefix[q[0]] == 0);
    }
    return res;
  }
}