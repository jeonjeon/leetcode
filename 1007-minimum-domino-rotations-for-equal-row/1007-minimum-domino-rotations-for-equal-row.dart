import 'dart:math';
class Solution {
  int minDominoRotations(List<int> top, List<int> bot) {
    // d: domino number
    final res = List.generate(6, (d) => d + 1) // 1 - 6 dominoes
                  .map((d) => minRotation(d, top, bot)) // get minimum rotations for each domino number
                  .fold(top.length + 1, min); // fold minimum rotaions to total minimum

    // if minimum needed rotation is greater than top.length 
    // It means fail
    if (res > top.length) return -1; 
    return res;
  }
  // return minimum rotations for each domino number
  int minRotation(int d, List<int> top, List<int> bot){
    // t: the number of times the corresponding domino number appears on the top
    // b: the number of times the corresponding domino number appears on the bot
    int t = 0, b = 0;
    for (int i = 0; i < top.length; i++){
      // If neither the top nor the bottom has the corresponding domino number, it's a failure.
      if (top[i] != d && bot[i] != d) return top.length + 1;
      // If both the top and bottom match the domino number, no rotation is needed.
      if (top[i] == bot[i]) continue; 

      if (top[i] == d) t++;
      else b++;
    }
    return min(t, b);
  }
}