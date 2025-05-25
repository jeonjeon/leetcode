class Solution {
  int longestPalindrome(List<String> words) {
    int res = 0;
    bool center = false;
    final hm = <String, int>{};
    for (final w in words){
        final rev = w.split('').reversed.join('');
        if (!center && rev == w) {
            res += 2;
            center = true;
            continue;
        }
        if ((hm[rev] ?? 0) > 0){
            res += 4;
            hm[rev] = hm[rev]! - 1;
            continue;
        }
        hm[w] = (hm[w] ?? 0) + 1;
    }
    return res;
  }
}