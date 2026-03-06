class Solution {
  bool checkOnesSegment(String s) {
    bool zero = false;
    for (int i = 0; i < s.length; i++){
      if (s[i] == '0'){
        zero = true;
        continue;
      }
      if (zero) return false;
    }
    return true;
  }
}