import 'dart:math';
class Solution {
  int numberOfSubstrings(String s) {
    int res = 0;
    final n = s.length;
    final prefix = [0];
    for (int i = 0; i < n; i++){
        prefix.add(int.parse(s[i]) + prefix.last);
    }
    for (int l = 1; l < n + 1; l++){
        int r = l;
        while (r < n + 1){
            final ones = prefix[r] - prefix[l - 1];
            final zeros = r - l + 1 - ones;
            final square = zeros * zeros;
            if (square > ones){
                r += square - ones;
                continue;
            }
            if (square == ones){
                res++;
                r++;
                continue;
            }
            final diff = min(sqrt(ones).ceil() - zeros, n + 1 - r);
            // print(diff);
            res += diff;
            r += diff;
        }
    }
    return res;
  }
}