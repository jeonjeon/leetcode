class Solution {
  List<int> survivedRobotsHealths(List<int> pos, List<int> heal, String dir) {
    final n = pos.length;
    final arr = <(int, int, int, String)>[];
    for (int i = 0; i < n; i++){
      arr.add((i, pos[i], heal[i],dir[i]));
    }
    arr.sort((a, b) => a.$2.compareTo(b.$2));
    final res = <(int, int)>[];
    final R = <(int, int)>[];
    for (var (i, _, h, d) in arr){
      if (d == 'R'){
        R.add((i, h));
        continue;
      }
      while (R.isNotEmpty && h > 0){
        var (ri, rh) = R.removeLast();
        if (rh == h){
          h = 0;
          break;
        }
        if (rh > h){
          rh--;
          h = 0;
          R.add((ri, rh));
          break;
        }
        h--;
      }
      if (h > 0){
        res.add((i, h));
      }
    }
    res.addAll(R);
    res.sort((a, b) => a.$1.compareTo(b.$1));
    return res.map((a) => a.$2).toList();
  }
}