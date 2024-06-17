import 'dart:math';
class Solution {
  int maxProfit(List<int> prices) {
    if (prices.length < 2) return 0;
    final n = prices.length;
    final have = List.filled(n, 0);
    final none = List.filled(n, 0);
    have[0] = -prices[0];
    have[1] = max(have[0], -prices[1]);
    none[1] = max(0, have[0] + prices[1]);

    for (int i = 2; i < n; i++){
      have[i] = max(have[i - 1], none[i - 2] - prices[i]);
      none[i] = max(none[i - 1], have[i - 1] + prices[i]);
    }
    return none.last;
  }
}