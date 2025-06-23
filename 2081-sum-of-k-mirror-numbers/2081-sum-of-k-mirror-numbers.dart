class Solution {
  int kMirror(int k, int n) {
    int cnt = 0, res = 0, cur = 1;
    while (cnt < n){
      for (int i = cur; i < cur * 10; i++){
        final op = oddPal(i);
        if (isPal(k, op)){
          cnt++;
          res += op;
        }
        if (cnt == n) return res;
      }
      for (int i = cur; i < cur * 10; i++){
        final ep = evenPal(i);
        if (isPal(k, ep)){
          cnt++;
          res += ep;
        }
        if (cnt == n) return res;
      }
      cur *= 10;
    }
    return res;
  }
  int oddPal(int n){
    int res = n ~/ 10;
    while (n > 0){
      res *= 10;
      res += n % 10;
      n ~/= 10;
    }
    return res;
  }
  int evenPal(int n){
    int res = n;
    while (n > 0){
      res *= 10;
      res += n % 10;
      n ~/= 10;
    }
    return res;
  }

  bool isPal(int k, int cur){
    final s = cur.toRadixString(k);
    int l = 0, r = s.length - 1;
    while (l < r){
      if (s[l] != s[r]) return false;
      l++;
      r--;
    }
    return true;
  }
}