class Solution {
  final rows = List.generate(9, (_) => <int>{});
  final cols = List.generate(9, (_) => <int>{});
  final squares = List.generate(9, (_) => <int>{});
  void solveSudoku(List<List<String>> board) {
    for (int i = 0; i < 9; i++){
      for (int j = 0; j < 9; j++){
        if (board[i][j] == '.') continue;
        final cur = int.parse(board[i][j]);
        rows[i].add(cur);
        cols[j].add(cur);
        squares[i ~/ 3 * 3 + j ~/ 3].add(cur);
      }
    }
    recur(board, 0, 0);
  }
  bool can(int n, int i, int j){
    return true;
  }
  bool recur(List<List<String>> board, int i, int j){
    if (i >= 9) return true; 
    if (j >= 9) return recur(board, i + 1, 0);
    if (board[i][j] != '.') return recur(board, i, j + 1);
    for (int n = 1; n <= 9; n++){
    if (rows[i].contains(n)) continue;
    if (cols[j].contains(n)) continue;
    if (squares[i ~/ 3 * 3 + j ~/ 3].contains(n)) continue;
    board[i][j] = '$n';
    rows[i].add(n);
    cols[j].add(n);
    squares[i ~/ 3 * 3 + j ~/ 3].add(n);
    if (recur(board, i, j + 1)) return true;
    board[i][j] = '.';
    rows[i].remove(n);
    cols[j].remove(n);
    squares[i ~/ 3 * 3 + j ~/ 3].remove(n);
    }
    return false;
  }
}