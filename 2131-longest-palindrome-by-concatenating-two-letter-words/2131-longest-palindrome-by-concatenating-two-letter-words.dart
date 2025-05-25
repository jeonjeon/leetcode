class Solution {
  int longestPalindrome(List<String> words) {
    int res = 0;
    final hm = <String, int>{};
    for (final w in words){
        final rev = '${w[1]}${w[0]}';
        if ((hm[rev] ?? 0) > 0){
            res += 4;
            hm[rev] = hm[rev]! - 1;
            continue;
        }
        hm[w] = (hm[w] ?? 0) + 1;
    }
    final center = hm.entries.where((e) => e.value > 0)
                             .map((e) => e.key)
                             .any((k) => k == '${k[1]}${k[0]}');
    return res + (center ? 2 : 0);
  }
}