import 'dart:collection';
class Fancy {
  final mod = 1000000007;
  final arr = <int>[];
  final add = [0];
  final mult = [1];
  Fancy(); 
  
  void append(int val) {
    arr.add(val);
    add.add(add.last);
    mult.add(mult.last);
  }
  
  void addAll(int inc) {
    add.last += inc;
  }
  
  void multAll(int m) {
    add.last = add.last * m % mod;
    mult.last = mult.last * m % mod;
  }
  
  int getIndex(int idx) {
    if (idx >= arr.length) return -1;
    final m = mult.last * _modPow(mult[idx], mod - 2) % mod;
    final a = add.last - add[idx] * m;
    return (arr[idx] * m + a) % mod;
  }

  int _modPow(int x, int y) {
    int tot = 1;
    int p = x;
    for (; y > 0; y >>= 1) {
      if (y & 1 == 1) {
        tot = (tot * p) % mod;
      }
      p = (p * p) % mod;
    }
    return tot;
  }
}

/**
 * Your Fancy object will be instantiated and called as such:
 * Fancy obj = Fancy();
 * obj.append(val);
 * obj.addAll(inc);
 * obj.multAll(m);
 * int param4 = obj.getIndex(idx);
 */