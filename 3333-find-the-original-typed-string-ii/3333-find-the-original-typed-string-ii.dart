class Solution {
  int possibleStringCount(String word, int k) {
    final mod = 1000000007;
    final arr = <int>[];
    int cnt = 1;
    for (int i = 1; i < word.length; i++){
        if (word[i] == word[i - 1]){
            cnt++;
            continue;
        }
        arr.add(cnt);
        cnt = 1;
    }
    arr.add(cnt);

    int res = arr.reduce((a,b) => (a * b) % mod);
    var prev =  List.filled(k, 0);
    prev[0] = 1;
    for (final a in arr){
        var cur =  List.filled(k, 0);
        int sum = 0;
        for (int c = 1; c < k; c++){
            sum = (sum + prev[c - 1]) % mod;
            if (a < c) {
                sum -= (prev[c - a - 1] + mod) % mod;
            }
            cur[c] = sum;
        }
        prev = cur;
    }
    res = (res - prev.reduce((a, b) => a + b) + mod) % mod;
    return res;
  }
}