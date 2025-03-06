class Solution {
  List<int> findMissingAndRepeatedValues(List<List<int>> grid) {
    final res = [0, 0];
    final n = grid.length;
    final arr = List.filled(n * n + 1, 0);
    grid.expand((a) => a).forEach((a) => arr[a]++);
    for (int i = 1; i < arr.length; i++){
      if (arr[i] == 2) res[0] = i;
      if (arr[i] == 0) res[1] = i;
    }
    return res;
  }
}