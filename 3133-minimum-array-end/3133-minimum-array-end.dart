class Solution {
  int minEnd(int n, int x) {
    // print(7)
    int res = x;
    for (int i = 1; i < n; i++){
      res++;
      if (res & x != x){
        res |= x;
      }
    }
    return res;
  }
}