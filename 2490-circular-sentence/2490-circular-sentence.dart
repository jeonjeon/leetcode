class Solution {
  bool isCircularSentence(String s) {
    if (s[0] != s[s.length - 1]){
        return false;
    }
    final arr = s.split(' ');
    for (int i = 1; i < arr.length; i++){
        if (arr[i][0] != arr[i - 1][arr[i - 1].length - 1]) {
            return false;
        }
    }
    return true;
  }
}