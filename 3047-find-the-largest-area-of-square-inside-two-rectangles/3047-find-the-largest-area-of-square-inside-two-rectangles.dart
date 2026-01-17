import 'dart:math';
class Solution {
  int largestSquareArea(List<List<int>> arr, List<List<int>> tr) {
    int res = 0;
    for (int i = 0; i < arr.length; i++){
      arr[i] = [...arr[i], ...tr[i]];
    }
    arr.sort((a, b){
      if (a[0] == b[0]){
        return a[1].compareTo(b[1]);
      }
      return a[0].compareTo(b[0]);
    });
    for (int i = 0; i < arr.length; i++){
      for (int j = i + 1; j < arr.length; j++){
        final x1 = max(arr[i][0], arr[j][0]);
        final y1 = max(arr[i][1], arr[j][1]);
        final x2 = min(arr[i][2], arr[j][2]);
        final y2 = min(arr[i][3], arr[j][3]);
        if (x1 > x2 || y1 > y2) continue;
        final len = min(x2 - x1, y2 - y1);
        res = max(res, len * len);
      }
    }
    return res;
  }
}
// 1
// 4