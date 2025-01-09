class Solution {
  int countPrefixSuffixPairs(List<String> words) {
    int res = 0;
    for (int i = 1; i < words.length; i++){
      for (int j = 0; j < i; j++){
        if (isPair(words[j],words[i])){
          res++;
        }
      }
    }
    return res;
  }
  bool isPair (String a , String b){
    if (a.length > b.length) return false;
    bool fix = true;
    
    for (int i = 0; i < a.length; i++){
      if (a[i] != b[i]){
        fix = false;
        break;
      }
    }
    for (int i = 0; i < a.length; i++){
      if (a[a.length - 1 - i] != b[b.length - 1 - i]){
        fix = false;
        break;
      }
    }
    // print('a: $a, b: $b, fix: $fix');
    return fix;
  }
}