class Solution {
  bool hasIncreasingSubarrays(List<int> nums, int k) {
    if (k == 1) return true;
    int cnt = 1;
    final arr = List.filled(nums.length, false);
    for (int i = 1; i < nums.length; i++){
        if (nums[i] <= nums[i - 1]){
            cnt = 1;
            continue;
        }
        cnt++;
        if (cnt < k) continue;
        arr[i] = true;
        if (i < k) continue;
        // print('i: $i, arr: $arr, cnt: $cnt');
        if (arr[i - k] == true) return true;
    }
    return false;
  }
}