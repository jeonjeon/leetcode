import 'dart:math';
class Solution {
  int maxPower(List<int> stations, int rr, int k) {
    for (int i = 1; i < stations.length; i++){
        stations[i] += stations[i - 1];
    }
    int l = 0, r = 9223372036854775807;
    while (l < r){
        final mid = ((l + r) / 2).ceil();
        if (bs(stations, rr, k, mid)){
            l = mid;
        } else {
            r = mid - 1;
        }
    }
    return l;
  }
  bool bs(List<int> st, int reach, int k, int target){
    final arr = List.filled(st.length, 0);
    int add = 0;
    for (int i = 0; i < st.length; i++){
      add += arr[i];
      int cur = st[min(st.length - 1, i + reach)];
      if (i - reach - 1 >= 0){
        cur -= st[i - reach - 1];
      }
      cur += add;
      if (target <= cur) continue;
      final diff = target - cur;
      if (diff > k) return false;
      k -= diff;
      add += diff;
      if (i + reach * 2 + 1 >= st.length) continue;
      arr[i + reach * 2 + 1] -= diff;
    }
    return true;
  }
}