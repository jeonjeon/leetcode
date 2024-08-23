import 'dart:math';
class Solution {
  int largestOverlap(List<List<int>> img1, List<List<int>> img2) {
    final n = img1.length;
    int res = 0;
    for (int i = 1 - n; i < n; i++){
      for (int j = 1 - n; j < n; j++){
        int cnt = 0;
        for (int x = 0; x < n; x++){
          for (int y = 0; y < n; y++){
            if (x + i < 0 || x + i >= n || y + j < 0 || y + j >= n) continue;
            cnt += img1[y + j][x + i] & img2[y][x];
          }
        }
        res = max(res, cnt);
      }
    }
    return res;
  }
}