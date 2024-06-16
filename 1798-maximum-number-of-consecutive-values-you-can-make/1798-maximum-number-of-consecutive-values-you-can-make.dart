class Solution {
  int getMaximumConsecutive(List<int> coins) {
    coins.sort();
    int can = 1;
    for (int i = 0; i < coins.length; i++){
      if (coins[i] > can){
        break;
      }
      can += coins[i];
    }
    return can;
  }
}