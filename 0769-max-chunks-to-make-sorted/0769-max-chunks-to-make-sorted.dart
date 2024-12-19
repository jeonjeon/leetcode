import 'dart:math';
class Solution {
  int maxChunksToSorted(List<int> arr) {
    int res = 0, mx = -1;
    for (int i = 0; i < arr.length; i++){
        mx = max(mx, arr[i]);
        if (mx == i) res++;
    }
    return res;
  }
}