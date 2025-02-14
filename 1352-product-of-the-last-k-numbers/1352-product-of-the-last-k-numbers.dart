import 'dart:collection';
class ProductOfNumbers {
    var prd = [1];
  ProductOfNumbers() {}
  
  void add(int n) {
    if (n == 0) {
        prd = [1];
        return;
    }
    prd.add(prd.last * n);
  }
  
  int getProduct(int k) {
    if (prd.length <= k) return 0;
    return prd.last ~/ prd[prd.length - k - 1];
  }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers obj = ProductOfNumbers();
 * obj.add(num);
 * int param2 = obj.getProduct(k);
 */