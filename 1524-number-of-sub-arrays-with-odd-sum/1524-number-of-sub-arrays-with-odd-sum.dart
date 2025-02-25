class Solution {
  int numOfSubarrays(List<int> arr) {
    int res = 0, odd = 0, mod = 1000000007; 
    final cnt = List.filled(2, 0);
    for (final a in arr){
      cnt[(odd + 1) % 2]++;
      odd += a % 2;
      res = (res + cnt[odd % 2]) % mod;
    }
    return res;
  }
}