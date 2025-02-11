class Solution {
  String removeOccurrences(String s, String part) {
      while (true){
          final i = s.indexOf(part);
          if (i == -1){
              break;
          }
          s = s.substring(0,i) + s.substring(i+part.length);
      }
      return s;
  }
}