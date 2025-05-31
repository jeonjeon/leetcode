import 'dart:collection';
import 'dart:math';
class Solution {
  int snakesAndLadders(List<List<int>> board) {
    int res = 0;
    final len = board.length;
    final n2 = len * len;
    final rowCol = <List<int>>[];
    for (int i = 0; i < n2; i++){
        final div = i ~/ len;
        final row = len - div - 1;
        final mod = i % len;
        final col = div % 2 == 1 ? len - mod - 1 : mod;
        rowCol.add([row, col]);
    }
    var q = Queue<int>()..add(0);
    final visit = <int>{};
    while (q.isNotEmpty){
        res++;
        final temp = Queue<int>();
        while (q.isNotEmpty){
            final curr = q.removeFirst();
            if (visit.contains(curr)) continue;
            visit.add(curr);
            int mx = -1;
            for (int d = 1; d <= 6; d++){
                int next = curr + d;
                if (next == n2 - 1) return res;
                if (board[rowCol[next].first][rowCol[next].last] == -1){
                    mx = next;
                    continue;
                }
                next = board[rowCol[next].first][rowCol[next].last] - 1;
                if (next == n2 - 1) return res;
                temp.add(next);
            }
            if (mx > -1) {
                temp.add(mx);
            }
        }
        q = temp;
    }
    return -1;
  }
}