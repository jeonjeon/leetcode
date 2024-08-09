class Solution {
  int numMagicSquaresInside(List<List<int>> grid) {
    int res = 0;
    for (int y = 0; y < grid.length - 2; y++){
      for (int x = 0; x < grid.length - 2; x++){
        if (isMagic(grid, y, x)){
          res++;
        }
      }
    }
    return res;
  }
  bool isMagic(List<List<int>> grid, int y, int x){
    // check col sum & row sum & distinct
    final distinct = List.generate(9, (i) => i + 1).toSet();
    for (int i = 0; i < 3; i++){
      int col = 0;
      int row = 0;
      for (int j = 0; j < 3; j++){
        if (!distinct.contains(grid[y + i][x + j])) return false;
        distinct.remove(grid[y + i][x + j]);
        col += grid[y + i][x + j];
        row += grid[y + j][x + i];
      }
      if (col != 15 || row != 15) return false;
    }
    if (distinct.isNotEmpty) return false;
    // 대각선
    int diaL = 0;
    int diaR = 0;
    for (int i = 0; i < 3; i++){
      diaL += grid[y + i][x + i];
      diaR += grid[y + i][x + 2 - i];
    }
    if (diaL != 15 || diaR != 15) return false;
    return true;
  }
}