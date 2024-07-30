import 'dart:math';
class Solution {
  int minimumDeletions(String s) {
    int endWithA = 0, endWithB = 0;
    for (int i = 0; i < s.length; i++){
      if (s[i] == 'a'){
        endWithB++;
      } else {
        endWithB = min(endWithA, endWithB);
        endWithA++;
      }
    }
    return min(endWithA, endWithB);
  }
}