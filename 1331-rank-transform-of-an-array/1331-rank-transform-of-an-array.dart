import 'dart:collection';
class Solution {
  List<int> arrayRankTransform(List<int> arr) {
    final stm = SplayTreeMap<int, List<int>>((a, b) => a.compareTo(b));
    final res = List.filled(arr.length, 0);
    int rank = 1;
    for (int i = 0; i < arr.length; i++){
      (stm[arr[i]] ??= []).add(i);
    }
    for (final value in stm.values){
      for (final idx in value){
        res[idx] = rank;
      }
      rank++;
    }
    return res;
  }
}