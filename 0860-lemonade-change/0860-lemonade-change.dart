class Solution {
  bool lemonadeChange(List<int> bills) {
    int ten = 0, five = 0;
    for (var b in bills){
      if (b == 5) {
        five++;
        continue;
      }
      if (b == 10) ten++;
      if (b == 20){
        if (ten > 0){
          b -= 10;
          ten--;
        }
        five -= (b - 5) ~/ 5;
      } else {
        five -= 1;
      }
      if (ten < 0 || five < 0) return false;
    }
    return true;
  }
}