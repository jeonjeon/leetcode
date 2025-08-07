class Solution {
  int numOfUnplacedFruits(List<int> fruits, List<int> b) {
    int res = fruits.length;
    for (final f in fruits){
      for (int i = 0; i < b.length; i++){
        if (b[i] >= f){
          b[i] = 0;
          res--;
          break;
        }
      }
    }
    return res;
  }
}