class Solution {
  int minAddToMakeValid(String s) {
    var left = 0, right = 0;
    for (int i = 0; i < s.length; i++){
      if(s[i] == '('){
        left++;
      } else {
        if (left > 0){
          left--;
        } else {
          right++;
        }
      }
    }
    return left + right;
  }
}