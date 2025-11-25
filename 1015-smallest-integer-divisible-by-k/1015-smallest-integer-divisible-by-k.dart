class Solution {
  int smallestRepunitDivByK(int k) {
    int ones = 1;
    int res = 1;
    final visit = <int>{};
    while (ones % k > 0){
      if (visit.contains(ones)) return -1;
      visit.add(ones);
      ones *= 10;
      ones %= k;
      ones += 1;
      res++;
    }
    return res;
  }
}