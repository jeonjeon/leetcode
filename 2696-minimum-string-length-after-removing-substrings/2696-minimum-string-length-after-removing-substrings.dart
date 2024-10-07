class Solution {
  int minLength(String s) {
    var go = true;
    while (go){
      final l = s.length;
      s = s.replaceAll('AB', '');
      s = s.replaceAll('CD', '');
      go = l != s.length;
    }
    return s.length;
  }
}