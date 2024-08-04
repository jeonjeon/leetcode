class Solution {
  int rangeSum(List<int> nums, int _, int left, int right) {
    // make nums to prefix sum of nums
    for (int i = 1; i < nums.length; i++){
      nums[i] += nums[i - 1];
    }
    // make arr to sum of sorted subarray
    final arr = <int>[];
    for (int i = 0; i < nums.length; i++){
      for (int j = i; j < nums.length; j++){
        arr.add(nums[j] - (i > 0 ? nums[i - 1] : 0));
      }
    }
    arr.sort();
    // make arr to prefix sum of arr
    for (int i = 1; i < arr.length; i++){
      arr[i] += arr[i - 1];
    }
    // return range sum between left and right
    return arr[right - 1] - (left > 1 ? arr[left - 2] : 0);
  }
}