class Solution {
  String kthCharacter(int k, List<int> op) {
    k--;
    int res = 0;
    for (final o in op){
      if (k == 0) break;
      if (k & 1 == 1 && o == 1) res++;
      k >>= 1;
      res %= 26;
    }
    return String.fromCharCode('a'.codeUnitAt(0) + res);
  }
}