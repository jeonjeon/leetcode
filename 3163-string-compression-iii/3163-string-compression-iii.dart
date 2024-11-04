class Solution {
  String compressedString(String word) {
    var res = '';
    var prev = '';
    var cnt = 0;
    for (int i = 0; i < word.length; i++){
      if (prev != word[i]) {
        if (cnt > 0){
          res += '$cnt$prev';
        }
        prev = word[i];
        cnt = 1;
        continue;
      }
      if (cnt == 9){
        res += '$cnt$prev';
        cnt = 1;
        continue;
      }
      cnt++;
    }
    if (cnt > 0){
      res += '$cnt$prev';
    }
    return res;
  }
}