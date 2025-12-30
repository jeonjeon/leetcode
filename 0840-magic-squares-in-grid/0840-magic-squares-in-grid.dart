class Solution {
  int numMagicSquaresInside(List<List<int>> grid) {
    int res = 0;
    for (int i = 0; i <= grid.length - 3; i++){
      for (int j = 0; j <= grid[0].length - 3; j++){
        if (magic(grid,j,i)) res++;
      }
    }
    return res;
  }
  bool magic(List<List<int>> grid, int x, int y){
    final distinct = <int>{};
    final vert = List.filled(3, 0);
    final hori = List.filled(3, 0);
    int lr = 0, rl = 0;
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++){
        final cur = grid[y + i][x + j];
        distinct.add(cur);
        if (cur > 9 || cur < 1) return false;
        hori[i] += cur;
        vert[j] += cur;
        if (i == j) lr += cur;
        if (i == 0 && j == 2) rl += cur;
        if (i == 1 && j == 1) rl += cur;
        if (i == 2 && j == 0) rl += cur;
      }
    }
    final sett = {...vert, ...hori, lr, rl};
    // print('vert: $vert, hori: $hori, lr: $lr, rl: $rl');
    // print('x: $x, y: $y, sett: $sett');
    return sett.length == 1 && distinct.length == 9;
  }
}