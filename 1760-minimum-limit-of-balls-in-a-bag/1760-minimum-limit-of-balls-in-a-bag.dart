class Solution {
  int minimumSize(List<int> n, int m) {
    int l = 1, r = 1000000000;
    while (l < r){
        final mid = (l + r) ~/ 2;
        if (bs(n, m, mid)){
            r = mid;
        } else {
            l = mid + 1;
        }
    }
    return r;
  }
  bool bs(List<int> n, int m, int div){
    for (final b in n){
        if (b <= div) continue;
        m -= (b / div).ceil() - 1;
    }
    return m >= 0;
  }
}