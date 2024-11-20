class Solution {
    final a = 'a'.codeUnitAt(0);
  int takeCharacters(String s, int k) {
    final sArr = s.split('').toList();
    int l = 0, r = s.length;
    while (l <= r){
        final len = ((l + r) / 2).ceil();
        if (can(len, sArr, k)){
            l = len + 1;
        } else {
            r = len - 1;
        }
    }
    if (r == -1) return -1;
    return s.length - r;
  }
  bool can(int len, List<String> s, int k){
    final arr = List.filled(3, 0);
    s.skip(len)
     .map((w) => w.codeUnitAt(0) - a)
     .forEach((c) => arr[c]++);
    if (arr.every((a) => a >= k)) return true;
    for (int i = len; i < s.length; i++){
        arr[s[i].codeUnitAt(0) - a]--;
        arr[s[i - len].codeUnitAt(0) - a]++;
        if (arr.every((a) => a >= k)) return true;
    }
    return false;
  }
}