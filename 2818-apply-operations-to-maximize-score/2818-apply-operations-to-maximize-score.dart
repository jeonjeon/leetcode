import 'dart:math';
class Solution {
  final mod = 1000000007;
  int maximumScore(List<int> nums, int k) {
    int res = 1;
    // 1. get prime number less than 100000
    final primes = getPrimes(nums);
    // 2. count prime factors of each number in nums
    final primeFactors = nums.map((n) => getPrimeFactor(primes, n)).toList();
    // 3. find the longest left length less then each number
    final leftSmaller = getLeftSmaller(primeFactors);
    // 4. find the longest right length equal or less then each number
    final rightSmaller = getRightSmaller(primeFactors);
    // 5. zip nums[i] and leftSmaller[i] * rightSmaller[i]
    // leftSmaller[i] * rightSmaller[i] is a maximum count of applying operations
    final nnums = List.generate(primeFactors.length, (i) => [nums[i], leftSmaller[i] * rightSmaller[i]])
                ..sort((a, b) => b[0].compareTo(a[0]));

    for (final [n, cnt] in nnums){
        // maximum must in k
        final maximum = min(cnt, k);
        k -= maximum;
        res = (res * modPow(n, maximum)) % mod;
        if (k == 0) break;
    }
    // 6. done!
    return res;
  }

  // effective power operation with modular
  int modPow(int n, int cnt) {
    if (cnt == 0) return 1;
    
    final halfCnt = cnt ~/ 2;
    final mp = modPow(n, halfCnt) % mod;
    
    int res = (mp * mp) % mod;
    if (cnt % 2 == 1) res = (res * n) % mod;
    
    return res;
  }

  // the number of left numberrs less than current number include current number
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
  // the number of right numberrs equeal or greater than current number include current number
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
  // getting prime numbers
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

  // count prime factors of each number
  // memo is a hashmap for memoization
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
