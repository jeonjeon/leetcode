class Solution {
  final hm = <int, int>{};
  int sumFourDivisors(List<int> nums) {
    int res = 0;
    for (final n in nums){
      if (hm.containsKey(n)){
        res += hm[n]!;
        continue;
      }
      final sett = <int>{};
      for (int i = 1; i * i <= n; i++){
        if (n % i > 0) continue;
        sett.add(i);
        sett.add(n ~/ i);
        if (sett.length > 4) break;
      }
      // print('n: $n, sett: $sett');
      if (sett.length == 4){
        hm[n] = sett.reduce((a,b) => a + b);
        res += hm[n]!;
      }
    }
    return res;
  }
}