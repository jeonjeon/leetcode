class Solution {
  int getDescentPeriods(List<int> prices) {
    int res = 1, l = 0;
    for (int r = 1; r < prices.length; r++){
      if (prices[r] + 1 != prices[r - 1]){
        l = r;
      }
      res += r - l + 1;
    }
    return res;
  }
}