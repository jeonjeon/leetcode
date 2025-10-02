class Solution {
  int maxBottlesDrunk(int nb, int ne) {
    int res = 0;
    int empty = 0;
    while (nb > 0){
      res += nb;
      empty += nb;
      nb = 0;
      if (empty >= ne){
        nb++;
        empty -= ne;
        ne++;
      }
    }
    return res;
    
  }
}