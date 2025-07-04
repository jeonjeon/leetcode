class Solution {
  String kthCharacter(int k, List<int> op) {
    k--;
    int res = 0;
    for (final o in op){
      if (k == 0) break;
      if (k & 1 == 1) res += o;
      k >>= 1;
    }
    return String.fromCharCode('a'.codeUnitAt(0) + res % 26);
  }
}