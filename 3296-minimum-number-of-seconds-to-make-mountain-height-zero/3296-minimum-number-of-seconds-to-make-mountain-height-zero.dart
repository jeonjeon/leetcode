class Solution {
  final acc = List.generate(100001, (i) => i);
  int minNumberOfSeconds(int mh, List<int> wt) {
    for (int i = 1; i < 100001; i++){
      acc[i] += acc[i - 1];
    }
    int l = 1, r = acc.last * 1000000;
    while (l < r){
      final s = (l + r) ~/ 2;
      final h = bin(s, wt);
      if (h < mh){
        l = s + 1;
      } else {
        r = s;
      }
      // print('l: $l, r: $r');
    }
    return l;
  }
  int bin(int s, List<int> wt){
    int res = 0;
    for (final w in wt){
      int l = 0, r = 100000;
      while (l < r){
        final m = ((l + r) / 2).ceil();
        if (acc[m] * w > s){
          r = m - 1;
        } else {
          l = m;
        }
      }
      res += l;
    }
    return res;
  }
}