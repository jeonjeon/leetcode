class Solution {
  int numberOfStableArrays(int zero, int one, int limit) {
    const int MOD = 1000000007;
    int maxN = zero + one;
    
    List<int> fact = List.filled(maxN + 1, 0);
    List<int> invFact = List.filled(maxN + 1, 0);
    
    fact[0] = 1;
    invFact[0] = 1;
    for (int i = 1; i <= maxN; i++) {
      fact[i] = (fact[i - 1] * i) % MOD;
    }
    
    invFact[maxN] = _modPow(fact[maxN], MOD - 2, MOD);
    for (int i = maxN - 1; i >= 1; i--) {
      invFact[i] = (invFact[i + 1] * (i + 1)) % MOD;
    }
    
    int C(int n, int k) {
      if (k < 0 || k > n) {
        return 0;
      }
      return fact[n] * invFact[k] % MOD * invFact[n - k] % MOD;
    }
    
    int F(int N, int K, int L) {
      if (K <= 0 || K > N) {
        return 0;
      }
      int ans = 0;
      int maxJ = (N - K) ~/ L;
      for (int j = 0; j <= maxJ; j++) {
        int term = C(K, j) * C(N - j * L - 1, K - 1) % MOD;
        if (j & 1 == 1) {
          ans = (ans - term + MOD) % MOD;
        } else {
          ans = (ans + term) % MOD;
        }
      }
      return ans;
    }
    
    int maxK = zero < one + 1 ? zero : one + 1;
    List<int> fOne = List.filled(maxK + 2, 0);
    for (int k = 1; k < maxK + 2; k++) {
      fOne[k] = F(one, k, limit);
    }
    
    int ans = 0;
    for (int k = 1; k <= maxK; k++) {
      int fz = F(zero, k, limit);
      if (fz == 0) {
        continue;
      }
      int fo = (fOne[k - 1] + 2 * fOne[k] + fOne[k + 1]) % MOD;
      ans = (ans + fz * fo) % MOD;
    }
    
    return ans;
  }
  
  int _modPow(int base, int exp, int mod) {
    int result = 1;
    base %= mod;
    while (exp > 0) {
      if (exp & 1 == 1) {
        result = (result * base) % mod;
      }
      base = (base * base) % mod;
      exp >>= 1;
    }
    return result;
  }
}