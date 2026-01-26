import 'dart:math';
class Solution {
  List<List<int>> minimumAbsDifference(List<int> arr) {
    arr.sort();
    int mn = 2000000;
    for (int i = 1; i < arr.length; i++){
      mn = min(mn, arr[i] - arr[i - 1]);
    }
    final res = <List<int>>[];
    for (int i = 1; i < arr.length; i++){
      if (arr[i] - arr[i - 1] == mn){
        res.add([arr[i - 1], arr[i]]);
      }
    }
    return res;
  }
}