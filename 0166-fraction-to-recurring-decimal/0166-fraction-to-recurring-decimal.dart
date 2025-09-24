class Solution {
  String fractionToDecimal(int n, int d) {
    if (n == 0) return '0';
    String digit = '${n ~/ d}';
    if (digit == '0' && n * d < 0) digit = '-$digit';
    if (n < 0) n *= -1;
    if (d < 0) d *= -1;
    n %= d;
    if (n == 0) return '$digit';
    String fraction = '';
    final visit = <int, int>{};
    for (int i = 0; i < 10000; i++){
      if (n == 0) return '$digit.$fraction';
      if ((visit[n] ?? -1) >= 0){
        final single = fraction.substring(0, visit[n]!);
        final repeat = fraction.substring(visit[n]!);
        return '$digit.$single($repeat)';
      }
      visit[n] = i;
      n *= 10;
      fraction += '${n ~/ d}';
      n %= d;
    }
    return '$digit.($fraction)';
  }
}