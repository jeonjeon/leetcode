class Solution {
  List<List<int>> sortMatrix(List<List<int>> grid) {
    final n = grid.length;
    for (int i = 0; i < n; i++){
      final y = i, x = 0;
      final arr = <int>[];
      for (int j = 0; j < n - i; j++){
        arr.add(grid[y + j][x + j]);
      }
      arr.sort((a, b) => b.compareTo(a));
      for (int j = 0; j < n - i; j++){
        grid[y + j][x + j] = arr[j];
      }
    }
    for (int i = 1; i < n; i++){
      final y = 0, x = i;
      final arr = <int>[];
      for (int j = 0; j < n - i; j++){
        arr.add(grid[y + j][x + j]);
      }
      arr.sort();
      for (int j = 0; j < n - i; j++){
        grid[y + j][x + j] = arr[j];
      }
    }
    // print(grid);
    return grid;
  }
}