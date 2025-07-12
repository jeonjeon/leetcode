import 'dart:math' as math;

class Solution {
  int minR = double.maxFinite.toInt();
  int maxR = double.minPositive.toInt();
  
  void dfs(int mask, int round, int i, int j, int first, int second) {
    if (i >= j) {
      dfs(mask, round + 1, 0, 27, first, second);
    } else if ((mask & (1 << i)) == 0) {
      dfs(mask, round, i + 1, j, first, second);
    } else if ((mask & (1 << j)) == 0) {
      dfs(mask, round, i, j - 1, first, second);
    } else if (i == first && j == second) {
      minR = math.min(minR, round);
      maxR = math.max(maxR, round);
    } else {
      if (i != first && i != second) {
        dfs(mask ^ (1 << i), round, i + 1, j - 1, first, second);
      }
      if (j != first && j != second) {
        dfs(mask ^ (1 << j), round, i + 1, j - 1, first, second);
      }
    }
  }
  
  List<int> earliestAndLatest(int n, int first, int second) {
    minR = double.maxFinite.toInt();
    maxR = double.minPositive.toInt();
    
    dfs((1 << n) - 1, 1, 0, 27, first - 1, second - 1);
    return [minR, maxR];
  }
}