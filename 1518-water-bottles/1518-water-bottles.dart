class Solution {
  int numWaterBottles(int bot, int exc) {
    int res = 0, emp = 0;
    while (bot > 0){
      res += bot;
      emp += bot;
      bot = emp ~/ exc;
      emp %= exc;
    }
    return res;
  }
}