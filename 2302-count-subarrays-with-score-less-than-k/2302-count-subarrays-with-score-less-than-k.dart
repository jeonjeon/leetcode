class Solution {
  int countSubarrays(List<int> nums, int k) {
    int l = 0, sum = 0, res = 0;
    for (int r = 0; r < nums.length; r++){
        sum += nums[r];
        while (l < r && sum * (r - l + 1) >= k){
            sum -= nums[l];
            l++;
        }
        if (sum * (r - l + 1) < k) res += r - l + 1;
    }
    return res;
  }
}