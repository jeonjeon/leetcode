import 'dart:math';
class Solution {
  final mod = 1000000007;
  int maximumScore(List<int> nums, int k) {
    int res = 1;
    final primes = getPrimes(nums);
    final pf = nums.map((n) => getPrimeFactor(primes, n)).toList();
    final leftSmaller = getLeftSmaller(pf);
    final rightSmaller = getRightSmaller(pf);
    final nnums = List.generate(pf.length, (i) => [nums[i], leftSmaller[i] * rightSmaller[i]])
                ..sort((a, b) => b[0].compareTo(a[0]));
    // print(primes);
    // print(pf);
    // print(leftSmaller);
    // print(rightSmaller);
    // print(nnums);
    for (final [n, mx] in nnums){
        final cnt = min(mx, k);
        k -= cnt;
        res = (res * modPow(n, cnt)) % mod;
        // print('res: $res, n: $n, cnt: $cnt, k: $k');
        if (k == 0) break;
    }
    return res;
  }
  int modPow(int n, int cnt) {
    if (cnt == 0) return 1;
    
    final halfCnt = cnt ~/ 2;
    final mp = modPow(n, halfCnt) % mod;
    
    int res = (mp * mp) % mod;
    if (cnt % 2 == 1) res = (res * n) % mod;
    
    return res;
  }
  List<int> getLeftSmaller(List<int> pf){
    final leftSmaller = List.filled(pf.length, 0);
    final stack = <(int, int)>[];
    for (int i = 0; i < pf.length; i++){
        int tot = 1;
        while(stack.isNotEmpty && stack.last.$1 < pf[i]){
            final (_, cnt) = stack.removeLast();
            tot += cnt;
        }
        leftSmaller[i] = tot;
        stack.add((pf[i], tot));
    }
    return leftSmaller;
  }
  List<int> getRightSmaller(List<int> pf){
    final rightSmaller = List.filled(pf.length, 0);
    final stack = <(int, int)>[];
    for (int i = pf.length - 1; i >= 0; i--){
        int tot = 1;
        while(stack.isNotEmpty && stack.last.$1 <= pf[i]){
            final (_, cnt) = stack.removeLast();
            tot += cnt;
        }
        rightSmaller[i] = tot;
        stack.add((pf[i], tot));
    }
    return rightSmaller;
  }
  List<int> getPrimes(List<int> nums){
    final che = List.filled(100001, true);
    final primes = <int>[];
    for (int i = 2; i < 100001; i++){
        if (!che[i]) continue;
        primes.add(i);
        for (int j = 2; i * j < 100001; j++){
            che[i * j] = false;
        }
    }
    return primes;
  }
  final memo = <int, int>{};
  int getPrimeFactor(List<int> primes, int n){
    if (memo.containsKey(n)) return memo[n]!;
    int nn = n;
    int res = 0;
    for (final p in primes){
        if (nn % p != 0) continue;
        res++;
        while (nn % p == 0 && n > 1){
            nn ~/= p;
        }
        if (memo.containsKey(nn)){
            res += memo[nn]!;
            break;
        }
        if (nn == 1) break;
    }
    memo[n] = res;
    return memo[n]!;
  }
}
