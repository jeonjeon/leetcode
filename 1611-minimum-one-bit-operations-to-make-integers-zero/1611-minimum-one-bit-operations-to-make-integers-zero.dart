import 'dart:collection';
class Solution {
  int minimumOneBitOperations(int n) {
    int res = 0;
    final q = Queue<int>();
    for (int i = 0; 1 << i <= n; i++){
        if (n & (1 << i) == 0) continue;
        q.add(n & (1 << i));
    }
    while (q.isNotEmpty){
        final first = q.removeFirst();
        if (q.length % 2 == 0) {
            res += (first << 1) - 1;
            continue;
        }
        final second = q.removeFirst();
        res += (second << 1) - (first << 1);
    }
    return res;
  }
}