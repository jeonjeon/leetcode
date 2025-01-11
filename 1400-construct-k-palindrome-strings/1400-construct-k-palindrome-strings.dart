class Solution {
  bool canConstruct(String s, int k) {
    if (s.length < k) return false;
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < s.length; i++){
        arr[s.codeUnitAt(i) - a]++;
    }
    final odd = arr.where((x) => x % 2 == 1).length;
    return odd <= k;
  }
}