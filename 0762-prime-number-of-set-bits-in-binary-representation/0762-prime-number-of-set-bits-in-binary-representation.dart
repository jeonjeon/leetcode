class Solution {
  int countPrimeSetBits(int left, int right) {
    final primes = {2, 3, 5, 7, 11, 13, 17, 19};
    int res = 0;
    for (int n = left; n <= right; n++){
      if (primes.contains(bits(n))) res++;
    }
    return res;
  }
  int bits(int n) {
    int res = 0;
    while (n > 0){
      res += n & 1;
      n >>= 1;
    }
    return res;
  }
}