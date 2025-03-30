class Solution {
  List<int> partitionLabels(String s) {
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    final visit = <int>{};
    final res = <int>[];
    for (int i = 0; i < s.length; i++){
      final char = s.codeUnitAt(i) - a;
      arr[char]++;
    }
    int prevI = -1;
    for (int i = 0; i < s.length; i++){
      final char = s.codeUnitAt(i) - a;
      visit.add(char);
      arr[char]--;
      if (visit.every((v) => arr[v] == 0)){
        res.add(i - prevI);
        prevI = i;
        visit.clear();
      }
    }
    return res;
  }
}