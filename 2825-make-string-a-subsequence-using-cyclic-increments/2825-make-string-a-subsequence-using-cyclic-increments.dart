class Solution {
  bool canMakeSubsequence(String str1, String str2) {
    final a = 'a'.codeUnitAt(0);
    int j = 0;
    for (int i = 0; i < str1.length; i++){
        int diff = str2.codeUnitAt(j) - str1.codeUnitAt(i);
        if (diff < 0) diff += 26;
        if (diff <= 1) j++;
        if (j == str2.length) return true;
    }
    return false;
  }
}