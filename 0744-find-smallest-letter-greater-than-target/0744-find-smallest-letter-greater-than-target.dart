import 'dart:collection';
class Solution {
  String nextGreatestLetter(List<String> letters, String target) 
    => SplayTreeSet<String>.from(letters, (a, b) => a.compareTo(b))
                              .firstWhere((s) => s.compareTo(target) > 0, orElse: () => letters.first); 
}