class Solution {
  int minSteps(int n) {
    if (n < 2) return 0;
    final primeSet = List.generate(n - 1, (i) => i + 2).toSet();
    for (int i = 2; i * i <= n; i++){
      if (!primeSet.contains(i)) continue;
      for (int j = 2; i * j <= n; j++){
        primeSet.remove(i * j);
      }
    }
    final primes = primeSet.toList();
    int res = 0;
    for (final p in primes){
      while (n % p == 0){
        n ~/= p;
        res += p;
      }
      if (n == 1) return res;
    }
    return res + n;
  }
}