class Solution {
  String kthCharacter(int k) {
    k--;
    int add = 0;
    while (k > 0){
      add += k & 1;
      k >>= 1;
    }
    return String.fromCharCode(add % 26 + 'a'.codeUnitAt(0));
    
  }
}