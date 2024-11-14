class Solution {
  int minimizedMaximum(int n, List<int> q) {
    int l = 1, r = 100000;
    while (l < r){
        final mid = (l + r) ~/ 2;
        if (bs(mid, n, q)){
            r = mid;
        } else {
            l = mid + 1;
        }
    }
    return r;

  }
  bool bs(int lim, int n, List<int> q){
    for (final nn in q){
        n -= (nn / lim).ceil();
        if (n < 0) return false;
    }
    return true;
  }
}

