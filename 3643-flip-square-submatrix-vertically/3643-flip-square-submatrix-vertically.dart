class Solution {
  List<List<int>> reverseSubmatrix(List<List<int>> grid, int x, int y, int k) {
    final n = grid.length, m = grid[0].length; 
    for (int i = x; i < x + k ~/ 2; i++){
      for (int j = y; j < y + k; j++){
        final oi = x + k - 1 - (i - x);
        // print('oi: $oi, i: $i, j: $j');
        final temp = grid[oi][j];
        grid[oi][j] = grid[i][j];
        grid[i][j] = temp;
      }
    }
    return grid;
  }
}