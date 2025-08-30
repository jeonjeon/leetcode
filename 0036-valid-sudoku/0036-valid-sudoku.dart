class Solution {
  bool isValidSudoku(List<List<String>> board) {
    // horizontal
    for (final hori in board){
      final hSet = <String>{};
      for (final h in hori){
        if (h == '.') continue;
        if (hSet.contains(h)) return false;
        hSet.add(h);
      }
    }
    // print('hori pass');
    // vert
    for (int j = 0; j < 9; j++){
      final vSet = <String>{};
      for (int i = 0; i < 9; i++){
        if (board[i][j] == '.') continue;
        if (vSet.contains(board[i][j])) return false;
        vSet.add(board[i][j]);
      }
    }
    // print('vert pass');
    //square
    for (int i = 0; i < 9; i++){
      final sSet = <String>{};
      final iDiv = i ~/ 3;
      final iMod = i % 3;
      final iStart = iDiv * 3;
      for (int j = 0; j < 9; j++){
        final jDiv = j ~/ 3;
        final jMod = j % 3;
        final y = iStart + jDiv;
        final x = iMod * 3 + jMod;
        // print('y: $y, hx: $x');
        if (board[y][x] == '.') continue;
        if (sSet.contains(board[y][x])) return false;
        sSet.add(board[y][x]);
      }
    }
    return true;
  }
}