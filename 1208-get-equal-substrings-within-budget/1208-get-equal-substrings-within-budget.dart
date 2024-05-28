class Solution {
  int equalSubstring(String s, String t, int mc) {
    final diff = List.filled(s.length + 1, 0);
    for (int i = 1; i < diff.length; i++){
      diff[i] = (s.codeUnitAt(i - 1) - t.codeUnitAt(i - 1)).abs();
      diff[i] += diff[i - 1];
    }
    int l = 0;
    int r = diff.length - 1;
    //print('diff: $diff');
    while (l <= r){
      final m = ((l + r) / 2).ceil();
     // print('m: $m');
      if (bs(m, diff, mc)){
        //print(true);
        l = m + 1;
      } else {
        //print(false);
        r = m - 1;
      }
    }
    return r;
  }
  bool bs(int m, List<int> diff, int mc){
    for (int i = 0; i < diff.length - m; i++){
      if (diff[i + m] - diff[i] <= mc){
        return true;
      }
    }
    return false;
  }
}