class Solution {
  int nextBeautifulNumber(int n) {
    while (!balance(++n));
    return n;
  }
  bool balance(int n){
    final hm = <int, int>{};
    while (n > 0){
        final mod = n % 10;
        n ~/= 10;
        hm[mod] = (hm[mod] ?? 0) + 1;
    }
    return hm.entries.every((e) => e.key == e.value);
  }
}