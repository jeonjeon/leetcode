class Solution {
  int appendCharacters(String s, String t) {
    int ti = 0;
    for(int i = 0; i < s.length; i++){
      if(ti == t.length){
        break;
      }
      if(t[ti] == s[i]){
        ti++;
      }
    }
    return t.length - ti;
  }
}