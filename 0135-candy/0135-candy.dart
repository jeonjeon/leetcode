import 'dart:math';
class Solution {
  int candy(List<int> r) {
    final arr = List.filled(r.length, 1);
    // left to right
    for (int i = 1; i < r.length; i++){
        if (r[i] > r[i - 1]){
            arr[i] = arr[i - 1] + 1;
        }
    }
    // right to left
    for (int i = r.length - 2; i >= 0; i--){
        if (r[i] > r[i + 1]){
            arr[i] = max(arr[i], arr[i + 1] + 1);
        }
    }
    // return sum
    return arr.reduce((a, b) => a + b);
  }
}