class Solution {
  bool isPowerOfFour(int n) 
    => n > 0 && n & (n - 1) == 0 && (int.parse('01' * 16, radix: 2)) & n == n;
  
}