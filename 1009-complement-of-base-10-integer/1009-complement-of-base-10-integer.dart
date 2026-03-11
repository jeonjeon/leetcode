class Solution {
  int bitwiseComplement(int n) {
    int mask = 1;
    while (mask < n){
      mask <<= 1;
      mask++;
    }
    return n ^ mask;
  }
}