class Solution {
  final m = 1000000007;
  int numSubseq(List<int> nums, int t) {
    nums.sort();
    int res = 0, l = 0, r = nums.length - 1;
    while (l <= r){
      if (nums[l] + nums[r] > t){
        r--;
        continue;
      } 
      res = (res + modPow(r - l)) % m;
      l++;
    }
    return res;
  }
  final memo = List.filled(100001, 0);
  int modPow(int n){
    if (memo[n] > 0) return memo[n];
    if (n == 0) return 1;
    if (n == 1) return 2;
    final div = n ~/ 2;
    final mod = n % 2;
    int res = ((modPow(div) % m) * (modPow(div) % m)) % m;
    if (mod > 0) res = (res * modPow(mod)) % m;
    memo[n] = res;
    return memo[n];
  }
}