import 'dart:collection';
class Solution {
  bool primeSubOperation(List<int> nums) {
    final primes = SplayTreeSet<int>.from(List<int>.generate(1001, (i) => i) .where((i) => i > 1));
    for (int i = 2; i * i <= 1000; i++){
        if (!primes.contains(i)) continue;
        for (int j = i * 2; j <= 1000; j += i){
            if (primes.contains(j)) primes.remove(j);
        }
    }
    // print(primes);
    for (int i = 0; i < nums.length; i++){
        if (i > 0 && nums[i] <= nums[i - 1]) return false;
        var can = nums[i];
        for (final p in primes){
            if (p >= nums[i]) break;
            if (i > 0 && nums[i] - p <= nums[i - 1]) break;
            can = nums[i] - p;
        }
        nums[i] = can;
    }
    return true;
  }
}