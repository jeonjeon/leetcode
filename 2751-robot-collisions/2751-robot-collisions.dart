class Solution {
  List<int> survivedRobotsHealths(List<int> pos, List<int> heal, String dir) {
    final n = pos.length;
    final arr = <(int, int, String, int)>[];
    final res = <(int, String, int)>[];
    int l = 0, r = 0;
    for (int i = 0; i < n; i++){
      arr.add((pos[i], heal[i], dir[i], i));
    }
    arr.sort((a, b) => a.$1.compareTo(b.$1));
    for (final (p, h, d, i) in arr){
      if (d == 'R'){
        res.add((h, d, i));
        continue;
      }
      int curH = h;
      while (curH > 0 && res.isNotEmpty && res.last.$2 == 'R'){
        final (prevH, prevD, prevI) = res.removeLast();
        if (prevH < curH){
          curH -= 1;
          continue;
        }
        if (prevH > curH){
          res.add((prevH - 1, prevD, prevI));
          curH = 0;
          break;
        }
        curH = 0;
        break;
      }
      if (curH > 0){
        res.add((curH, d, i));
      }
    }
    res.sort((a, b) => a.$3.compareTo(b.$3));
    //print(res);
    return res.map((a) => a.$1).toList();
  }
}