class Solution {
  bool isValid(String word) {
    if (word.length < 3) return false;
    final v = {'a', 'e', 'i', 'o', 'u','A', 'E', 'I', 'O', 'U'};
    final a = 'a'.codeUnitAt(0);
    final z = 'z'.codeUnitAt(0);
    final A = 'A'.codeUnitAt(0);
    final Z = 'Z'.codeUnitAt(0);
    bool hasV = false;
    bool hasC = false;
    for (int i = 0; i < word.length; i++){
      final w = word.codeUnitAt(i);
      final isValid = (a <= w && w <= z) || (A <= w && w <= z) || int.tryParse(word[i]) != null;
      if (!isValid){
        return false;
      }
      if (v.contains(word[i])) {
        hasV = true;
        continue;
      }
      if (int.tryParse(word[i]) == null){
        hasC = true;
      }
    }
    return hasV && hasC;
    
  }
}