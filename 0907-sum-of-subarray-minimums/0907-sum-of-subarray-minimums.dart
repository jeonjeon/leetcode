class Solution {
    static const MOD = 1000000007;
  int sumSubarrayMins(List<int> arr) {
    int res = 0;
    int total = 0;
    final stack = <(int,int)>[];
    for (final a in arr){
      int curCnt = 1;
      while (stack.isNotEmpty && stack.last.$1 > a){
        final (val, cnt) = stack.removeLast();
        total -= val * cnt;
        curCnt += cnt;
      }
      total += a * curCnt;
      res += total;
      stack.add((a, curCnt));
    }
    return res % MOD;
  }
}