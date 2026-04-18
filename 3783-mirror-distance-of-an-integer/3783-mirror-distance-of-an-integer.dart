class Solution {
  int mirrorDistance(int n) => (n - reverse(n)).abs();
    
  
  int reverse(int n){
    int res = 0;
    while (n > 0){
      res *= 10;
      res += n % 10;
      n ~/= 10;
    }
    return res;
  }
}