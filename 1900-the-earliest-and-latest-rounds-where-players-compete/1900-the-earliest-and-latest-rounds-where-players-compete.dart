import 'dart:math';

class Solution {
  int mn = 28, mx = 1;
  late final int first;
  late final int second;
  
  void dfs(int mask, int round, int l, int r) {
    if (mask == 0) return;
    // print(mask);
    // the end of a round
    if (l <= r){
      dfs(mask, round + 1, 27, 0);
      return;
    }
    // the player lost already
    if (mask & (1 << r) == 0){
      dfs(mask, round, l, r + 1);
      return;
    }
    // the player lost already
    if (mask & (1 << l) == 0){
      dfs(mask, round, l - 1, r);
      return;
    }
    // first vs second
    if (r == first && l == second){
      mn = min(mn, round);
      mx = max(mx, round);
      return;
    }
    // l is the top player(first or second)
    if (l == first || l == second){
      dfs(mask ^ (1 << r), round, l - 1, r + 1);
      return;
    }
    // r is the top player(first or second)
    if (r == first || r == second){
      dfs(mask ^ (1 << l), round, l - 1, r + 1);
      return;
    }
    // r player wins
    dfs(mask ^ (1 << l), round, l - 1, r + 1);
    // l player wins
    dfs(mask ^ (1 << r), round, l - 1, r + 1);
  }
  
  List<int> earliestAndLatest(int n, int first, int second) {
    this.first = first - 1;
    this.second = second - 1;
    dfs((1 << n) - 1, 1, 27, 0);
    return [mn, mx];
  }
}