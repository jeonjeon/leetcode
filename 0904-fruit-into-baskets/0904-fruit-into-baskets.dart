import 'dart:math';
class Solution {
  int totalFruit(List<int> fruits) {
    final hm = <int,int>{};
    int l = 0, cnt = 0, res = 0;
    for (int r = 0; r < fruits.length; r++){
      hm[fruits[r]] = (hm[fruits[r]] ?? 0) + 1;
      cnt++;
      while (l < fruits.length && hm.length > 2){
        hm[fruits[l]] = hm[fruits[l]]! - 1;
        cnt--;
        if (hm[fruits[l]] == 0) hm.remove(fruits[l]);
        l++;
      }
      res = max(res, cnt);
    }
    return res;
  }
}