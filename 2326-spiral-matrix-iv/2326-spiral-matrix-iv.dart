/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  final dir = [(0, 1), (1, 0), (0, -1), (-1, 0)];
  List<List<int>> spiralMatrix(int m, int n, ListNode? head) {
    final matrix = List.generate(m, (i) => List.filled(n, -1));
    int y = 0, x = -1, di = 0;
    bool prevFail = false;
    while (head != null){
      final (dy, dx) = dir[di];
      final ny = y + dy;
      final nx = x + dx;
      if (isOver(ny, nx, m, n) || matrix[ny][nx] != -1) {
        if (prevFail) break;
        prevFail = true;
        di = (di + 1) % 4;
        continue;
      }
      y = ny;
      x = nx;
      prevFail = false;
      matrix[y][x] = head.val;
      head = head.next;
    }
    return matrix;
  }
  bool isOver(int ny, int nx, int m, int n){
    return ny < 0 || m <= ny || nx < 0 || n <= nx;
  }
}