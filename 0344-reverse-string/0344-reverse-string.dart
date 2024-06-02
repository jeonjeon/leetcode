class Solution {
  void reverseString(List<String> s) {
    for(int i = 0; i < s.length; i++){
      final l = s.length - i - 1;
      if(i >= l) return;
      final temp = s[i];
      s[i] = s[l];
      s[l] = temp;
    }
  }
}