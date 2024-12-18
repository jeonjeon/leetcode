import 'dart:math';
class Solution {
  List<int> finalPrices(List<int> prices) {
    final res = <int>[];
    for (int i = 0; i < prices.length; i++){
        int p = prices[i];
        for (int j = i + 1; j < prices.length; j++){
            if (p >= prices[j]){
                p -= prices[j];
                break;
            }
        }
        res.add(p);
    }
    return res;
  }
}