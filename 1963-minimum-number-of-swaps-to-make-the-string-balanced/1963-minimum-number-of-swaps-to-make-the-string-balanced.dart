class Solution {
  int minSwaps(String s) {
      int left = 0;
      for (int i = 0; i < s.length; i++){
          if (s[i] == '['){
              left++;
              continue;
          }
          if (left > 0){
              left--;
          }
      }
      return (left / 2).ceil();
  }
}