class Solution {
  final mod = 1000000007;
  late List<int> fact, inv, invFact; 
  int countBalancedPermutations(String n) {
    // 초기화
    final arr = n.split('')
                 .map((s) => int.parse(s))
                 .toList();
    final cnt = List.filled(10, 0);
    arr.forEach((a) => cnt[a]++);
    final sum = cnt.indexed.fold(0, (x, c) => x + c.$1 * c.$2);
    if (sum % 2 == 1) return 0;
    final half = sum ~/ 2;
    final even = n.length ~/ 2;

    precompute(n.length);

    // 합이 절반이 되는 경우의 수
    final dp = List.generate(even + 1, (_) => List.filled(half + 1, 0));
    dp[0][0] = 1;
    for (int i = 0; i < arr.length; i++) {
      final cur = arr[i];
      for (int p = even; p >= 1; p--) {
        for (int s = half; s >= cur; s--) {
          dp[p][s] += dp[p - 1][s - cur];
          dp[p][s] %= mod;
        }
      }
    }
    // print(dp);
    // print(invFact);
    int res = ((dp[even][half] * fact[even]) % mod) * fact[n.length - even] % mod;
    for (final c in cnt){
        res *= invFact[c];
        res %= mod;
    }
    return res;

    // final dp = 
  }
  void precompute(int n) {
    fact = List.filled(n + 1, 0);
    inv = List.filled(n + 1, 0);
    invFact = List.filled(n + 1, 0);

    fact[0] = inv[0] = invFact[0] = 1;

    for (int i = 1; i <= n; i++) {
      fact[i] = (fact[i - 1] * i) % mod;
    }

    inv[1] = 1;
    for (int i = 2; i <= n; i++) {
      inv[i] = mod - (mod ~/ i) * inv[mod % i] % mod;
    }

    for (int i = 1; i <= n; i++) {
      invFact[i] = (invFact[i - 1] * inv[i]) % mod;
    }
  }
}