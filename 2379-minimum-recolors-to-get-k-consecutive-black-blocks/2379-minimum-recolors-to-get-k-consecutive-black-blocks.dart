import 'dart:math';
class Solution {
  int minimumRecolors(String blocks, int k) {
    int w = blocks.split('')
                    .take(k)
                    .where((s) => s == 'W')
                    .length;
    int res = w;
    for (int i = k; i < blocks.length; i++){
        if (blocks[i] == 'W') w++;
        if (blocks[i - k] == 'W') w--;
        res = min(res, w);
    }
    return res;
  }
}