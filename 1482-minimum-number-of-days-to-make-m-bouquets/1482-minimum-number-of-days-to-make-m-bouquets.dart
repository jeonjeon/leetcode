class Solution {
  int minDays(List<int> day, int m, int k) {
    final n = day.length;
    if (m * k > n){
      return -1;
    }
    int l = 1;
    int r = 1000000001;
    while (l <= r){
      final mid = ((l + r) / 2).ceil();
      if (canMake(day, m, k, mid)){
        r = mid - 1;
      } else {
        l = mid + 1;
      }
    }
    return l;
  }
  bool canMake(List<int> day, int m, int k, int mid){
    int cnt = 0;
    for (final d in day){
      if (d <= mid){
        cnt++;
      } else {
        cnt = 0;
      }
      if (cnt == k){
        cnt = 0;
        m--;
      }
      if (m == 0){
        return true;
      }
    }
    return false;
  }
}