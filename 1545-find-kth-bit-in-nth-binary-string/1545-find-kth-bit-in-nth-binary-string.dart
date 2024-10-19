class Solution {
  String findKthBit(int n, int k) {
    final l = log(k) ~/ log(2) + 1;
    int total = (1 << l) - 1;
    int xor = 0;
    while (total > 1){
      final half = (total / 2).ceil();
      // print('half: $half, k: $k, total: $total');
      if (k == half){
        return '${xor ^ 1}';
      } 
      if (k > half){
        k = total - k + 1;
        xor ^= 1;
      }
      total = half - 1;
      // print('half: $half, k: $k, total: $total');
    }
    return '$xor';
  }
}