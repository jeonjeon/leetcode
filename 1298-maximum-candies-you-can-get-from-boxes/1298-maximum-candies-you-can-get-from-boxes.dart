import 'dart:collection';
class Solution {
  int maxCandies(List<int> status, List<int> candies, List<List<int>> keys, List<List<int>> containedBoxes, List<int> initialBoxes) {
    int res = 0;
    final oBox = Queue<int>()..addAll(initialBoxes.where((b) => status[b] == 1));
    final cBox = <int>{}..addAll(initialBoxes.where((b) => status[b] == 0));
    final keySet = <int>{};
    while (oBox.isNotEmpty){
      final box = oBox.removeFirst();
      res += candies[box];
      for (final key in keys[box]){
        if (cBox.contains(key)){
          oBox.add(key);
          cBox.remove(key);
          continue;
        }
        keySet.add(key);
      }
      for (final newBox in containedBoxes[box]){
        if (status[newBox] == 1 || keySet.contains(newBox)){
          oBox.add(newBox);
          keySet.remove(newBox);
          continue;
        }
        cBox.add(newBox);
      }
    }
    return res;
  }
}
