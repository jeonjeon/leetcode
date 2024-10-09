class Solution {
  int minAddToMakeValid(String s) {
      int res = 0;
      final stack = <String>[];
      for(int i = 0; i < s.length; i++){
          if (s[i] == '('){
              stack.add(s[i]);
              continue;
          }
          if (stack.isNotEmpty){
              stack.removeLast();
              continue;
          }
          res++;
      }
      return res + stack.length;
  }
}