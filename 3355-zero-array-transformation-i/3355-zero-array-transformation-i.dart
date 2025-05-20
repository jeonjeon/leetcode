class Solution {
  bool isZeroArray(List<int> nums, List<List<int>> queries) {
    final arr = List.filled(nums.length + 1, 0);
    for (final q in queries){
        arr[q.first]++;
        arr[q.last + 1]--;
    }
    for (int i = 0; i < nums.length; i++){
        if (i > 0) arr[i] += arr[i - 1];
        if (arr[i] < nums[i]) return false;
    }
    return true;
  }
}