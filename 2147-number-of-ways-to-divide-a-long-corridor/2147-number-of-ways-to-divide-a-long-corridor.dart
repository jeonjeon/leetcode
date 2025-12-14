class Solution {
  int numberOfWays(String cor) {
    int res = 1, seat = 0;
    final mod = 1000000007;
    var left = List.filled(2, -1);
    var right = List.filled(2, -1);
    for (int i = 0; i < cor.length; i++){
      if (cor[i] == 'P') continue;
      seat++;
      if (left[0] == -1){
        left[0] = i;
        continue;
      }
      if (left[1] == -1){
        left[1] = i;
        continue;
      }
      if (right[0] == -1){
        right[0] = i;
        continue;
      }
      right[1] = i;
      // print('left: $left, right: $right');
      res = (res * (right[0] - left[1])) % mod;
      left = right;
      right = List.filled(2, -1);
    }
    if (seat == 0 || seat % 2 == 1) return 0;
    return res;
  }
}