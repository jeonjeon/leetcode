class Solution {
  int prefixCount(List<String> words, String pref) 
    => words.where((w) => w.startsWith(pref)) .length;
}