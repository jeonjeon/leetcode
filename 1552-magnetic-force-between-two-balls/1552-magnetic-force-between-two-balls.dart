class Solution {
  int maxDistance(List<int> pos, int m) {
    pos.sort();
    int l = 1;
    int r = pos.last;
    while (l <= r){
      final mid = (l + r) ~/ 2;
      //print('mid: $mid');
      if (can(pos, m, mid)){
        //print(true);
        l = mid + 1;
      } else {
        //print(false);
        r = mid - 1;
      }
    }
    return r;
  }
  bool can(List<int> pos, int m, int dist){
    int last = 0;
    for (final p in pos){
      if (last == 0 || p - last >= dist){
       // print('last: $last, p: $p, dist: $dist');
        last = p;
        m--;
      }
      if (m == 0){
        return true;
      }
    }
    return false;
  }
}