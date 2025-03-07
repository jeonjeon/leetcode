class Solution {
  List<int> closestPrimes(int left, int right) {
    final res = [-1, -1];
    final primes = List.filled(right + 1, true);
    primes[0] = false;
    primes[1] = false;
    for (int i = 2; i <= right; i++){
      if (!primes[i]) continue;
      for (int j = 2; j * i <= right; j++){
        primes[i * j] = false;
      }
    }
    int l = left;
    while (true){
      while (l <= right && !primes[l]){
        l++;
      }
      int r = l + 1;
      while (r <= right && !primes[r]){
        r++;
      }
      if (r > right) break;
      if (res[0] == -1 || res[1] - res[0] > r - l){
        res[0] = l;
        res[1] = r;
      }
      l++;
    }
    return res;
  }
}