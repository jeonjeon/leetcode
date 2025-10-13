class Solution {
  List<String> removeAnagrams(List<String> words) {
    final stack = <String>[];
    for (final w in words){
      if (stack.isNotEmpty && ana(stack.last, w))  continue;
      stack.add(w);
    }
    return stack;
  }
  bool ana(String s1, String s2){
    if (s1.length != s2.length) return false;
    final a = 'a'.codeUnitAt(0);
    final arr = List.filled(26, 0);
    for (int i = 0; i < s1.length; i++){
        arr[s1.codeUnitAt(i) - a]++;
        arr[s2.codeUnitAt(i) - a]--;
    }
    return arr.every((n) => n == 0);
  }
}