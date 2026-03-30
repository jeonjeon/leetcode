class Solution {
  bool checkStrings(String s1, String s2) {
    final a = 'a'.codeUnitAt(0);
    final odd = List.filled(26, 0);
    final even = List.filled(26, 0);
    for (int i = 0; i < s1.length; i++){
      if (i % 2 == 0){
        even[s1.codeUnitAt(i) - a]++;
        even[s2.codeUnitAt(i) - a]--;
        continue;
      }
      odd[s1.codeUnitAt(i) - a]++;
      odd[s2.codeUnitAt(i) - a]--;
    }
    return even.every((e) => e == 0) && odd.every((o) => o == 0);
  }
}