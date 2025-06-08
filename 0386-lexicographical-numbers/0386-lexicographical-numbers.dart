class Solution {
  final res = <int>[];
  List<int> lexicalOrder(int n) {
    dfs(n, 1);
    return res;
  }
  void dfs(int n, int upper){
    if (upper > n) return;
    res.add(upper);
    for (int i = 1; i < 10; i++){
        if (upper * 10 <= n){
            dfs(n, upper * 10);
        }
        upper++;
        if (upper > n || upper % 10 == 0) return;
        res.add(upper);
    }
  }
}