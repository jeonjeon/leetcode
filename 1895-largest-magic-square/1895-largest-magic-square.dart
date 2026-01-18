import 'dart:math';
class Solution {
  int largestMagicSquare(List<List<int>> grid) {
    final m = grid.length, n = grid[0].length;
    final mn = min(m, n);
    for (int len = mn; len >= 1; len--){
      // print(len);
      for (int vs = 0; vs + len <= m; vs++){
        for (int hs = 0; hs + len <= n; hs++){
          final hori = List.filled(len, 0);
          final vert = List.filled(len, 0);
          final digo = List.filled(2, 0);
          for (int i = 0; i < len; i++){
            for (int j = 0; j < len; j++){
              hori[j] += grid[i + vs][j + hs];
              vert[i] += grid[i + vs][j + hs];
              if (i == j) digo[0] += grid[i + vs][j + hs];
              if (i + j == len - 1) digo[1] += grid[i + vs][j + hs];
            }
          }
          // print('hori: $hori');
          // print('vert: $vert');
          // print('digo: $digo');
          if ({...hori, ...vert, ...digo}.length == 1){
            return len;
          }
        }
      }
    }
    return 0;
  }
}