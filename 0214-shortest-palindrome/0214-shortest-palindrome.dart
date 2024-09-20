class Solution {
  String shortestPalindrome(String s) {
    final rev = s.split('').reversed.join('');
    for (int i = 0; i < s.length; i++){
      bool isPal = true;
      for (int j = 0; j + i < s.length; j++){
        if (s[j] != rev[j + i]) {
          isPal = false;
          break;
        }
      }
      if (isPal){
        return rev.substring(0, i) + s;
      }
    }
    return s;
  }
}