class Solution {
  bool checkInclusion(String s1, String s2) {
    if (s1.length > s2.length) return false;
    final n = s1.length;
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < n; i++){
      arr[s1.codeUnitAt(i) - a]++;
      arr[s2.codeUnitAt(i) - a]--;
    }
    if (arr.every((x) => x == 0)) return true;
    // print(arr);
    for (int i = n; i < s2.length; i++){
      arr[s2.codeUnitAt(i - n) - a]++;
      arr[s2.codeUnitAt(i) - a]--;
      // print('i: $i, arr: $arr');
      if (arr.every((x) => x == 0)) return true;
    }
    return false;
  }
}