class Solution {
  String addSpaces(String s, List<int> spaces) {
    final sb = StringBuffer();
    int j = 0;
    for (int i = 0; i < spaces.length; i++){
        while (j < spaces[i]){
            sb.write(s[j]);
            j++;
        }
        sb.write(' ');
    }
    for (int i = j; i < s.length; i++){
        sb.write(s[i]);
    }
    return sb.toString();
  }
}